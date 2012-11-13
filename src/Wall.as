package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
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
		
	}

}
