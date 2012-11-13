package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity 
	{
		public function Wall(x:int, y:int, w:int, h:int) 
		{
			this.x = x;
			this.y = y;


			type = A.typWALL;
			setHitbox(w, h);
			
			graphic = GenerateGraphic();
			originX = -3;
		}

		override public function removed():void
		{
			graphic = undefined;
		}
		
		private function GenerateGraphic():Canvas
		{
			var nTiles:int;
			var centreBitmap:BitmapData = new A.gfxWALLMIDDLE().bitmapData; //Unnnngggh
			var wallCanvas:Canvas = new Canvas(width+5,height); //The whole canvas
			var blitRect:Rectangle = new Rectangle(0,0,3,height); //The culling rectangle

			wallCanvas.draw(0,0,new A.gfxWALLLEFT().bitmapData,blitRect); //Draw left side
			wallCanvas.draw(wallCanvas.width - 3,0,new A.gfxWALLRIGHT().bitmapData,blitRect); //Draw right side

			blitRect.width = width - 1;
			nTiles = width % centreBitmap.width;

			for(var i:int = 0; i < nTiles; ++i)
			{
				wallCanvas.draw(3 + i*centreBitmap.width,0,centreBitmap,blitRect);
				blitRect.width -= centreBitmap.width;
			}

			return wallCanvas;
		}
	}

}
