class Particle extends MovieClip{
    //////////// variables ////////////
    private var __group:ParticleGroup;
	private var mods:Object;
	private var ordMods:Array;

    //////////// Constructor ////////////
    public function Particle() {
		mods = new Object();
		
		onEnterFrame = enterFrameHdl;
		onLoad = LoadHdl;
		onUnload = UnloadHdl;
    }
		
	//////////// Properties functions ////////////
	public function get group():ParticleGroup{
		return __group;
	}
	public function set group(val:ParticleGroup){
		if(__group != val){
			if(__group){
				__group.removeParticle(this);
			}
			__group = val;
			if(__group && _parent){
				__group.addParticle(this);
			}
		}
	}
		
	//////////// Public functions ////////////
	public function addMods(mods:Object):Void{
		var id:String;
		for(id in mods){
			if(mods[id] instanceof ParticleMod){
				__addMod(id,mods[id]);
			}
		}
		for(id in mods){
			if(mods[id] instanceof ParticleMod){
				mods[id].onInit();
			}
		}
		updateModOrder();
	}
	public function addMod(id:String,mod:ParticleMod):Void{
		__addMod(id,mod);
		mods[id].onInit();
		updateModOrder();
	}
	public function getMod(id:String):ParticleMod{
		return mods[id];
	}
	public function getModId(mod:ParticleMod):String{
		for(var id:String in mods){
			if(mods[id] === mod){
				return id;
			}
		}
		return null;
	}
	public function removeMod(id:String):Void{
		mods[id].particle = null;
		delete mods[id];
		updateModOrder()
	}
	public function clearMods():Void{
		for(var id:String in mods){
			mods[id].particle = null;
		}
		mods = new Object();
		ordMods = new Array();
	}
	//////////// Private functions ////////////
	private function __addMod(id:String,mod:ParticleMod):Void{
		mod[id] = mod;
		mod[id].particle = this;
	}
	private function updateModOrder(){
		ordMods = new Array();
		for(var id:String in mods){
			ordMods.push(mods[id]);
		}
		ordMods.sortOn('priority', Array.NUMERIC);
	}
		
	//////////// Event Handlers functions ////////////
	private function enterFrameHdl(){
		for(var i:Number=0; i<ordMods.length; i++){
			ordMods[i].onTick();
		}
	}
	
	private function LoadHdl(){
		for(var i:Number=0; i<ordMods.length; i++){
			ordMods[i].onInit();
		}
		__group.addParticle(this);
	}
	private function UnloadHdl(){
		__group.removeParticle(this);
	}
}
