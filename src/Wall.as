package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		
		public function Wall(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			type = "wall";
			
			setHitbox(2, 2);
			
			graphic = new Image(new BitmapData(2, 2, false, 0x4E5159));
		}
		
	}

}