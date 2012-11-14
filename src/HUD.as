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
		private var deadTextBG1:Text = new Text("", 1, 0, { size: 8, color: 0 } );
		private var deadTextBG2:Text = new Text("", -1, 0, { size: 8, color: 0 } );
		private var deadTextBG3:Text = new Text("", 0, -1, { size: 8, color: 0 } );
		private var deadTextBG4:Text = new Text("", 0, 1, { size: 8, color: 0 } );
		
		private var deadMessage:Graphiclist = new Graphiclist(deadTextBG1, deadTextBG2, deadTextBG3, deadTextBG4, deadText);
		
		public function HUD() 
		{
			scoreText.scrollX = deadText.scrollX = deadTextBG1.scrollX = deadTextBG2.scrollX = deadTextBG3.scrollX = deadTextBG4.scrollX = 0; //camera scrolling xfactor = 0
			scoreText.scrollY = deadText.scrollY = deadTextBG1.scrollY = deadTextBG2.scrollY = deadTextBG3.scrollY = deadTextBG4.scrollY = 0; //camera scrolling yfactor = 0
		}
		
		override public function update():void
		{
			graphic = (Game.dead) ? deadMessage : ((Game.started) ? scoreText : startText);
			
			if (Game.dead) deadText.text = deadTextBG1.text = deadTextBG2.text = deadTextBG3.text = deadTextBG4.text = "YOU RAN " + String(Math.floor(Game.score)) + "m\n\nYOU'RE REALLY\nGOOD AT RUNNING\nTO THE RIGHT\n\nPRESS SPACE";
			
			scoreText.text = String(Math.floor(Game.score)) + "m";
			scoreText.x = FP.width - (scoreText.width - 1);

			FP.world.bringToFront(this);
		}
		
	}
}
