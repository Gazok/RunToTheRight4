package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	
	public class Fern extends Entity 
	{
		private var a:Image = new Image(new BitmapData(4, 4, false, 0));
		
		public function Fern(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			graphic = a;
			
			setHitbox(4, 4);
			type = A.typFERN;
		}
		
	}

}