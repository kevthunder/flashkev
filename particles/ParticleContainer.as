import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Matrix;
import flash.geom.ColorTransform;


class ParticleContainer extends MovieClip{
    //////////// variables ////////////
	private var _particleType:String = "particle";
	
	private var particles:Array;
	
    //////////// Constructor ////////////
    public function ParticleContainer() {
		particles = new Array();
		
		onLoad = LoadHdl;
    }
		
	//////////// Properties functions ////////////
	public function get particleType():String{
		return _particleType;
	}
	
	public function set particleType(val:String){
		_particleType = val;
	}
	
		
	//////////// Public functions ////////////
	public function start(){
		//trace(_particleType);
		var list:Array = new Array();
		for(var i in this){
			if(!(this[i] instanceof Particle) && (this[i] instanceof MovieClip || this[i] instanceof TextField)){
				list.push(this[i]);
			}
		}
		for(var i =0; i<list.length;i++){
			list[i]._visible = true;
			var pos:Point = new Point(list[i]._x,list[i]._y);
			//var particle:MovieClip = this.createEmptyMovieClip(_particleType+particles.length, this.getNextHighestDepth());
			var particle:MovieClip = this.attachMovie(_particleType, _particleType+particles.length, this.getNextHighestDepth());
			particle._x = pos.x;
			particle._y = pos.y;
			if(list[i] instanceof MovieClip){
				list[i]._x = 0;
				list[i]._y = 0;
				var particleBitmap:BitmapData = new BitmapData(list[i]._width+1, list[i]._height+1, true, 0x00000000);
				particleBitmap.draw(list[i],list[i].transform.matrix);
				particle.attachBitmap(particleBitmap,particle.getNextHighestDepth(),"auto",true);
				particles.push(particle);
				list[i]._x = pos.x;
				list[i]._y = pos.y;
			}else if(list[i] instanceof TextField){
				var textField:TextField = particle.createTextField("txt",particle.getNextHighestDepth(),0,0,list[i]._width,list[i]._height);
				textField.text = list[i].text;
				textField.setNewTextFormat(list[i].getTextFormat());
				textField.setTextFormat(list[i].getTextFormat());
				textField.embedFonts = list[i].embedFonts;
			}
			list[i]._visible = false;
		}
	}
	//////////// Private functions ////////////
	
	
	//////////// Event Handlers functions ////////////
	private function LoadHdl(){
		start();
	}
}
