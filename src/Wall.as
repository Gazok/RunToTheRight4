package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		// controls characteristics of next wall
		private var wallGap:int = FP.rand(21) + 10; // 10 - 30
		private var wallLength:int = FP.rand(61) + 40; // 40 - 100
		private var wallHeight:int = FP.rand(36) + 5; // 5 - 40
		
		private var created:Boolean = false;
		
		public function Wall(x:int, y:int, w:int, h:int) 
		{
			this.x = x;
			this.y = y;
			
			type = A.typWALL;
			setHitbox(w, h);
			
			graphic = new Image(new BitmapData(w, h, false, 0x4E5159));
			
			Game.speed += 0.01;
		}
		
		override public function update():void
		{
			x -= Game.speed;
			
			if (!created && x + width <= FP.width - wallGap) // right side of wall
			{
				created = true;
				FP.world.add(new Wall(FP.width, FP.height - wallHeight, wallLength, wallHeight));
			}
			
			if (x < -width) FP.world.remove(this);
		}
		
	}

}