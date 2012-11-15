package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		private static const leftBitmap:BitmapData = new A.gfxWALLLEFT().bitmapData; //Unnnngggh
		private static const rightBitmap:BitmapData = new A.gfxWALLRIGHT().bitmapData; //Unnnngggh
		private static const centreBitmap:BitmapData = new A.gfxWALLMIDDLE().bitmapData; //Unnnngggh
		
		private var ferns:int = FP.rand(3);
		
		public function Wall(x:int, y:int, w:int, h:int) 
		{
			this.x = x;
			this.y = y;

			type = A.typWALL;
			setHitbox(w, h);
			
			graphic = GenerateGraphic();
			originX = -3;
			
			for (var i:int = 0; i < ferns; i ++)
			{
				FP.world.add(new Fern(x + FP.rand(w - 7) + 4, y - 4)); // randomly between 4 and width - 4
			}
		}

		override public function removed():void
		{
			graphic = undefined; //No idea if this actually causes garbage collection
		}
		
		private function GenerateGraphic():Canvas
		{
			var nTiles:int = 0;
			var wallCanvas:Canvas = new Canvas(width+5,height); //The whole canvas
			var blitRect:Rectangle = new Rectangle(0,0,3,height); //The culling rectangle

			wallCanvas.draw(0,0,leftBitmap,blitRect); //Draw left side
			wallCanvas.draw(wallCanvas.width - 3,0,rightBitmap,blitRect); //Draw right side

			blitRect.width = width - 1;
			nTiles = Math.ceil(width / centreBitmap.width);

			for(var i:int = 0; i < nTiles; ++i)
			{
				wallCanvas.draw(3 + i*centreBitmap.width,0,centreBitmap,blitRect); //Move across by graphic width
				blitRect.width -= centreBitmap.width;
			}

			return wallCanvas;
		}
	}

}
