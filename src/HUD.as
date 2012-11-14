package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;

	public class HUD extends Entity 
	{
		private var scoreText:Text = new Text("", 0, -1, { size: 8, color: 0xE6E4D5 } );
		private var scoreTextList:Graphiclist = new Graphiclist;
		
		private var startText:Array = [new Text("RUN TO THE", 17, 6, { size: 8, color: 0xE6E4D5 } ), new Text("RIGHT #4", 17, 15, { size: 8, color: 0xE6E4D5 } ), new Text("PRESS SPACE", 17, 45, { size: 8, color: 0xE6E4D5 } )];
		private var startTextList:Graphiclist = new Graphiclist;
		
		public static var deadText:Array = [new Text("", 0, 4, { size: 8, color: 0xE6E4D5 } ), new Text("", 0, 16, { size: 8, color: 0xE6E4D5 } ), new Text("", 0, 25, { size: 8, color: 0xE6E4D5 } ), new Text("", 0, 34, { size: 8, color: 0xE6E4D5 } ), new Text("PRESS SPACE", 0, 47, { size: 8, color: 0xE6E4D5 } )];
		public static var deadTextList:Graphiclist = new Graphiclist;
		
		public function HUD() 
		{
			// populate graphiclist with text
			for (i = 0; i < startText.length; i ++) startTextList.add(startText[i]);
			
			// center start text
			for (i = 0; i < startText.length; i ++) startText[i].x = (FP.width - startText[i].width) / 2;
			
			// empty graphiclist
			startTextList.removeAll();
			
			// populate graphiclist with text shadows
			for (var i:int = 0; i < startText.length; i ++)
			{
				startTextList.add(new Text(startText[i].text, startText[i].x - 1, startText[i].y, { size: startText[i].size, color: 0 } ));
				startTextList.add(new Text(startText[i].text, startText[i].x + 1, startText[i].y, { size: startText[i].size, color: 0 } ));
				startTextList.add(new Text(startText[i].text, startText[i].x, startText[i].y - 1, { size: startText[i].size, color: 0 } ));
				startTextList.add(new Text(startText[i].text, startText[i].x, startText[i].y + 1, { size: startText[i].size, color: 0 } ));
			}
			
			// re-populate graphiclist with text
			for (i = 0; i < startText.length; i ++) startTextList.add(startText[i]);
			
			// camera scrolling factors
			scoreTextList.scrollX = deadTextList.scrollX = 0;
			scoreTextList.scrollY = deadTextList.scrollY = 0;
		}
		
		override public function update():void
		{
			graphic = (Game.dead) ? deadTextList : ((Game.started) ? scoreTextList : startTextList);
			
			scoreText.text = String(Math.floor(Game.score)) + "m";
			
			// populate graphiclist with text
			scoreTextList.add(scoreText);
			
			// center start text
			scoreText.x = FP.width - (scoreText.width - 1);
			
			// empty graphiclist
			scoreTextList.removeAll();
			
			// populate graphiclist with text shadows
			scoreTextList.add(new Text(scoreText.text, scoreText.x - 1, scoreText.y, { size: scoreText.size, color: 0 } ));
			scoreTextList.add(new Text(scoreText.text, scoreText.x + 1, scoreText.y, { size: scoreText.size, color: 0 } ));
			scoreTextList.add(new Text(scoreText.text, scoreText.x, scoreText.y - 1, { size: scoreText.size, color: 0 } ));
			scoreTextList.add(new Text(scoreText.text, scoreText.x, scoreText.y + 1, { size: scoreText.size, color: 0 } ));
			
			// re-populate graphiclist with text
			scoreTextList.add(scoreText);

			FP.world.bringToFront(this);
		}
		
		public static function die():void
		{
			// decide death text
			deadText[0].text = "YOU RAN " + String(Math.floor(Game.score)) + "m";
			deadText[1].text = "YOU'RE REALLY";
			deadText[2].text = "GOOD AT RUNNING"; // TODO: make message dependent upon score
			deadText[3].text = "TO THE RIGHT";
			
			// populate graphiclist with text
			for (i = 0; i < deadText.length; i ++) deadTextList.add(deadText[i]);
			
			// center start text
			for (i = 0; i < deadText.length; i ++) deadText[i].x = (FP.width - deadText[i].width) / 2;
			
			// empty graphiclist
			deadTextList.removeAll();
			
			// populate graphiclist with text shadows
			for (var i:int = 0; i < deadText.length; i ++)
			{
				deadTextList.add(new Text(deadText[i].text, deadText[i].x - 1, deadText[i].y, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(new Text(deadText[i].text, deadText[i].x + 1, deadText[i].y, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(new Text(deadText[i].text, deadText[i].x, deadText[i].y - 1, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(new Text(deadText[i].text, deadText[i].x, deadText[i].y + 1, { size: deadText[i].size, color: 0 } ));
			}
			
			// re-populate graphiclist with text
			for (i = 0; i < deadText.length; i ++) deadTextList.add(deadText[i]);
		}
		
	}
}
