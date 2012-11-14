package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;

	public class HUD extends Entity 
	{
		private var scoreText:Text = new Text("", 0, -1, { size: 8 } );
		private var startText:Text = new Text("RUN TO THE\nRIGHT #4\n\nPRESS SPACE", 17, 3, { size: 8 } );
		private var deadText:Text = new Text("", 0, 0, { size: 8 } );
		
		public function HUD() 
		{
			scoreText.scrollX = deadText.scrollX = 0; //camera scrolling xfactor = 0
			scoreText.scrollY = deadText.scrollY = 0; //camera scrolling yfactor = 0
		}
		
		override public function update():void
		{
			graphic = (Game.dead) ? deadText : ((Game.started) ? scoreText : startText);
			
			if (Game.dead) deadText.text = "YOU RAN " + String(Math.floor(Game.time * 100)) + "km\n\nYOU'RE REALLY\nGOOD AT RUNNING\nTO THE RIGHT\n\nPRESS SPACE";
			
			scoreText.text = String(Math.floor(Game.time * 100)) + "km";
			scoreText.x = FP.width - (scoreText.width - 1);

			FP.world.bringToFront(this);
		}
		
	}
}
