
class ParticleMod extends Object{
    //////////// variables ////////////
	private var __priority:Number = 0;
	private var __particle:Particle;

    //////////// Constructor ////////////
    public function ParticleMod(priority:Number) {
		if(priority !== undefined){
			__priority = priority;
		}
    }
		
	//////////// Properties functions ////////////
	public function get priority():Number{
		return __priority;
	}
	public function set priority(val:Number){
		__priority = val;
	}
	
	public function get particle():Particle{
		return __particle;
	}
	public function set particle(val:Particle){
		__particle = val;
	}
		
	//////////// Public functions ////////////
	public function onInit(){
		
	}
	
	public function onTick(){
		
	}
	
	public function clone():ParticleMod{
		var clone = new ParticleMod();
		clone.priority = this.priority;
		return clone;
	}
	//////////// Private functions ////////////
		
	//////////// Event Handlers functions ////////////
	
}
