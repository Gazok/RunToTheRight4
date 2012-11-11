package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		// controls characteristics of next wall
		// Hence shouldn't be inside the wall class
		/*private var _wallGap:int = FP.rand(21) + 10; // 10 - 30
		private var _wallWidth:int = FP.rand(61) + 40; // 40 - 100
		private var _wallHeight:int = FP.rand(36) + 5; // 5 - 40 */
		
		private var _created:Boolean = false;

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
			/*if (!_created && x + width <= FP.width - _wallGap) // right side of wall
			{
				_created = true;
				FP.world.add(new Wall(FP.width, FP.height - _wallHeight, _wallLength, _wallHeight));
			}
			
			if (x < -width) FP.world.remove(this);*/
		}
		
	}

}
