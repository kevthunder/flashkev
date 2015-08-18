class ParticleGroup extends Object{
    //////////// variables ////////////
	private var particles:Array;
	private var mods:Object;
	
    //////////// Constructor ////////////
    public function ParticleGroup(mods) {
		particles = new Array();
		this.mods = new Object();
		if(mods !== undefined){
			addMods(mods);
		}
    }
		
	//////////// Properties functions ////////////
		
	//////////// Public functions ////////////
	public function addParticle(particle:Particle){
		particles.push(particle);
		copyModsToParticle(mods,particle);
	}
	
	public function getParticlePos(particle:Particle){
		for(var i = 0;i<particles.length;i++){
			if(particles[i] == particle){
				return i;
			}
		}
		return -1;
	}
	
	public function removeParticle(particle:Particle){
		var index:Number = getParticlePos(particle);
		if(index != -1){
			particles.splice(index,1);
		}
	}
	
	
	
	public function addMods(mods:Object):Void{
		for(var id:String in mods){
			if(mods[id] instanceof ParticleMod){
				__addMod(id,mods[id]);
			}
		}
		copyModsToParticles(mods);
	}
	public function addMod(id:String,mod:ParticleMod):Void{
		__addMod(id,mod);
		for(var i:Number = 0; i<particles.length; i++){
			particles[i].addMod(id,mod.clone());
		}
	}
	public function setModProperty(id:String,prop:String,val){
		mods[id][prop] = val;
		for(var i:Number = 0; i<particles.length; i++){
			particles[i].getMod(id)[prop] = val;
		}
	}
	public function removeMod(id:String):Void{
		delete mods[id];
		for(var i:Number = 0; i<particles.length; i++){
			particles[i].removeMod(id);
		}
	}
	public function clearMods():Void{
		for(var id:String in mods){
			mods[id].particle = null;
		}
		mods = new Object();
		for(var i:Number = 0; i<particles.length; i++){
			particles[i].clearMods();
		}
	}
	//////////// Private functions ////////////
	private function __addMod(id:String,mod:ParticleMod):Void{
		mods[id] = mod;
	}
	private function copyModsToParticle(mods:Object,particle:Particle):Void{
		var copied:Object = new Object();
		for(var id:String in mods){
			copied[id] = mods[id].clone();
		}
		particle.addMods(copied);
	}
	private function copyModsToParticles(mods:Object):Void{
		for(var i:Number = 0; i<particles.length; i++){
			copyModsToParticle(mods,particles[i]);
		}
	}
	//////////// Event Handlers functions ////////////
	
}
