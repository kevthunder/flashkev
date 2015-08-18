import flash.geom.Point;

class ParticleVelocity extends ParticleMod{
    //////////// variables ////////////
    private var __spd:Number=0;
    private var __angle:Number=0;
    private var __rotation:Number=0;

    //////////// Constructor ////////////
    public function ParticleVelocity(spd:Number,angle:Number,rotation:Number,priority:Number) {
		super(priority);
		if(spd == undefined){
			__priority = 100;
		}
		if(spd != undefined){
			__spd = spd;
		}
		if(angle != undefined){
			__angle = angle;
		}
		if(rotation != undefined){
			__rotation = rotation;
		}
    }
		
	//////////// Properties functions ////////////
	public function get spd():Number{
		return __spd;
	}
	public function set spd(val:Number){
		__spd = val;
	}
	public function get angle():Number{
		return __angle;
	}
	public function set angle(val:Number){
		__angle = val;
	}
	public function get rotation():Number{
		return __rotation;
	}
	public function set rotation(val:Number){
		__rotation = val;
	}
		
	//////////// Public functions ////////////
	public function onInit(){
		
	}
	
	public function onTick(){
		var move:Point = Point.polar(__spd,__angle/180*Math.PI);
		particle._y+=move.x;
		particle._x+=move.y;
		particle._rotation+=__rotation;
	}
	
	public function clone():ParticleMod{
		var clone = new ParticleVelocity();
		clone.priority = this.priority;
		clone.spd = this.spd;
		clone.angle = this.angle;
		clone.rotation = this.rotation;
		return clone;
	}
	
	//////////// Private functions ////////////
		
	//////////// Event Handlers functions ////////////
	
}
