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
		}
		
		override public function update():void
		{
			scoreText.text = String(Math.floor(Game.time * 100));
			scoreText.x = FP.width - (scoreText.width - 1);
		}
		
	}

}