import flash.geom.Point;

class ParticleLetterChanger extends ParticleMod{
    //////////// variables ////////////
	
	
    private var __original_letter:String;
    private var __timeout:Number = 0;
    private var __timeout2:Number = 0;

    //////////// Constructor ////////////
    public function ParticleLetterChanger(priority:Number) {
		
    }
		
	//////////// Properties functions ////////////
	
		
	//////////// Public functions ////////////
	public function onInit(){
		if(particle['txt'] != undefined){
			__original_letter = particle['txt'].text;
			__timeout = particle.getDepth()*4;
			__timeout2 = __timeout+10;
			particle._visible=false;
			//trace(__original_letter);
		}
	}
	
	public function onTick(){
		if(__timeout>0){
			particle._visible=false;
			//trace(__timeout);
			__timeout--;
		}else{
			particle._visible=true;
		}
		if(__timeout2>0){
			//trace(String.fromCharCode(97+Math.floor(Math.random()*26)));
			particle['txt'].text = String.fromCharCode(97+Math.floor(Math.random()*26));
			__timeout2--;
		}else{
			particle['txt'].text = __original_letter;
		}
	}
	
	public function clone():ParticleMod{
		var clone = new ParticleLetterChanger();
		clone.priority = this.priority;
		return clone;
	}
	
	//////////// Private functions ////////////
		
	//////////// Event Handlers functions ////////////
	
}
