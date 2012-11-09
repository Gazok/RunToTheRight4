package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		
		public function Wall(x:int, y:int, w:int, h:int) 
		{
			this.x = x;
			this.y = y;
			
			type = A.typWALL;
			setHitbox(w, h);
			
			graphic = new Image(new BitmapData(w, h, false, 0x4E5159));
		}
		
		override public function update():void
		{
			x --;
			
			if (x + width == 60) // right side of wall
			{
				FP.world.add(new Wall(FP.width, 40, 80, 20));
			}
			
			if (x < -width) FP.world.remove(this);
		}
		
	}

}