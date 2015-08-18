import flash.geom.Point;

class ParticleWindSimulator extends ParticleMod{
    //////////// variables ////////////
    private var __targetSpd:Number = 3;
    private var __acceleration:Number = 0.1;
    private var __targetAngle:Number = 0;
    private var __rotationSpd:Number = 4;
    private var __spreadAngle:Number = 70;
	
	
    private var __angleTendency:Number = 0;

    //////////// Constructor ////////////
    public function ParticleWindSimulator(targetSpd:Number, acceleration:Number, targetAngle:Number, rotationSpd:Number, spreadAngle:Number, priority:Number) {
		if(targetSpd !== undefined){
			__targetSpd = targetSpd;
		}
    	if(acceleration !== undefined){
			__acceleration = acceleration;
		}
    	if(targetAngle !== undefined){
			__targetAngle = targetAngle;
		}
    	if(rotationSpd !== undefined){
			__rotationSpd = rotationSpd;
		}
    	if(spreadAngle !== undefined){
			__spreadAngle = spreadAngle;
		} 
    }
		
	//////////// Properties functions ////////////
	public function get targetSpd():Number{
		return __targetSpd;
	}
	public function set targetSpd(val:Number){
		__targetSpd = val;
	}
	
	public function get acceleration():Number{
		return __acceleration;
	}
	public function set acceleration(val:Number){
		__acceleration = val;
	}
	
	public function get targetAngle():Number{
		return __targetAngle;
	}
	public function set targetAngle(val:Number){
		__targetAngle = val;
	}
	
	public function get rotationSpd():Number{
		return __rotationSpd;
	}
	public function set rotationSpd(val:Number){
		__rotationSpd = val;
	}
	
	public function get spreadAngle():Number{
		return __spreadAngle;
	}
	public function set spreadAngle(val:Number){
		__spreadAngle = val;
	}
		
	//////////// Public functions ////////////
	public function onInit(){
		var velocity = particle.getMod('velocity');
		velocity.rotation =  Math.random()*8 -4;
	}
	
	public function onTick(){
		var velocity = particle.getMod('velocity');
		if(Math.floor(Math.random()*15)==0){
			__angleTendency = (Math.random()-(velocity.angle-__targetAngle+__spreadAngle)/__spreadAngle/2)*__rotationSpd;
		}
		velocity.angle += __angleTendency;
		
		if(velocity.spd != __targetSpd){
			if(Math.abs(__targetSpd - velocity.spd) < __acceleration){
				velocity.spd = __targetSpd;
			}else{
				velocity.spd += __acceleration * Math.abs(__targetSpd - velocity.spd)/(__targetSpd - velocity.spd);
			}
		}
	}
	
	public function clone():ParticleMod{
		var clone = new ParticleWindSimulator();
		clone.priority = this.priority;
		clone.targetSpd = this.targetSpd;
		clone.acceleration = this.acceleration;
		clone.targetAngle = this.targetAngle;
		clone.rotationSpd = this.rotationSpd;
		clone.spreadAngle = this.spreadAngle;
		return clone;
	}
	
	//////////// Private functions ////////////
		
	//////////// Event Handlers functions ////////////
	
}
