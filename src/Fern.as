package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	
	public class Fern extends Entity 
	{
		
		public function Fern(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			graphic = new Image(A.gfxFERN);
			
			setHitbox(4, 4);
			type = A.typFERN;
		}
		
		override public function update():void
		{
			if (x < width) FP.world.remove(this);
		}
		
	}

}