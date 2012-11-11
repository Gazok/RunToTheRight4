package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;

	public class HUD extends Entity 
	{
		private var scoreText:Text = new Text("", 0, -1, { size: 8 } );
		
		public function HUD() 
		{
			graphic = scoreText;
			graphic.scrollX = 0; //camera scrolling xfactor = 0
			graphic.scrollY = 0; //camera scrolling yfactor = 0
		}
		
		override public function update():void
		{
			scoreText.text = String(Math.floor(Game.time * 100));
			scoreText.x = FP.width - (scoreText.width - 1);

			FP.world.bringToFront(this);
		}
		
	}
}
