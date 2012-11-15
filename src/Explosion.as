package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Explosion extends Entity
	{
		private var spr:Spritemap = new Spritemap(A.gfxEXPLOSION, 15, 14);
		private var theX:int;
		
		public function Explosion(inX:int, y:int) 
		{
			theX = inX;
			spr.angle = 90 * Math.floor(Math.random() * 4);
			spr.scaleX = spr.scaleY = 2;
			spr.originX = spr.originY = 7;
			super(x, y + 7);
			spr.add("explode", [0, 1, 2, 3, 4, 5], 12, false);
			spr.play("explode");
			graphic = spr;
		}
		
		override public function update():void
		{
			x = FP.camera.x + theX;
			if (spr.index == 5) FP.world.remove(this);
		}
		
	}

}