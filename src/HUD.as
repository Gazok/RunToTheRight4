package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;

	public class HUD extends Entity 
	{
		private var scoreText:Text = new Text("", 0, -1, { size: 8 } );
		private var startText:Text = new Text("RUN TO THE\nRIGHT #4\n\nPRESS SPACE", 17, 3, { size: 8 } );
		private var deadText:Text = new Text("", 0, 0, { size: 8 } );
		private var deadTextBG:Text = new Text("", 1, 0, { size: 8, color: 0 } );
		
		private var deadMessage:Graphiclist = new Graphiclist(deadTextBG, deadText);
		
		public function HUD() 
		{
			scoreText.scrollX = deadText.scrollX = deadTextBG.scrollX = 0; //camera scrolling xfactor = 0
			scoreText.scrollY = deadText.scrollY = deadTextBG.scrollY = 0; //camera scrolling yfactor = 0
		}
		
		override public function update():void
		{
			graphic = (Game.dead) ? deadMessage : ((Game.started) ? scoreText : startText);
			
			if (Game.dead) deadText.text = deadTextBG.text = "YOU RAN " + String(Math.floor(Game.score)) + "m\n\nYOU'RE REALLY\nGOOD AT RUNNING\nTO THE RIGHT\n\nPRESS SPACE";
			
			scoreText.text = String(Math.floor(Game.score)) + "m";
			scoreText.x = FP.width - (scoreText.width - 1);

			FP.world.bringToFront(this);
		}
		
	}
}
