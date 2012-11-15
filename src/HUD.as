package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;

	public class HUD extends Entity 
	{
		public static var ft:Array = [];
		public static var t:int = 0;

		private var scoreText:Text = new Text("", 0, -1, { size: 8, color: 0xE6E4D5 } );
		private var scoreTextList:Graphiclist = new Graphiclist;

		private var startText:Array = [new Text("RUN TO THE", 17, 6, { size: 8, color: 0xE6E4D5 } ), new Text("RIGHT #4", 17, 15, { size: 8, color: 0xE6E4D5 } ), ft[0] = new Text("PRESS SPACE", 17, 45, { size: 8, color: 0xE6E4D5 } )];
		private var startTextList:Graphiclist = new Graphiclist;

		public static var deadText:Array = [new Text("", 0, 4, { size: 8, color: 0xE6E4D5, resizable: true } ), new Text("", 0, 16, { size: 8, color: 0xE6E4D5, resizable: true } ), new Text("", 0, 25, { size: 8, color: 0xE6E4D5, resizable: true } ), new Text("TO THE RIGHT", 0, 34, { size: 8, color: 0xE6E4D5 } ), ft[1] = new Text("PRESS SPACE", 0, 47, { size: 8, color: 0xE6E4D5 } )];
		public static var deadTextList:Graphiclist = new Graphiclist;

		public static var score:int = 0;

		public function HUD() 
		{
			// populate graphiclist with text
			for (var i:int = 0; i < startText.length; i ++) startTextList.add(startText[i]);

			// center start text
			for (i = 0; i < startText.length; i ++) startText[i].x = (FP.width - startText[i].width) / 2;

			// empty graphiclist
			startTextList.removeAll();

			// populate graphiclist with text shadows
			for (i = 0; i < startText.length; i ++)
			{
				startTextList.add(ft[2] = new Text(startText[i].text, startText[i].x - 1, startText[i].y, { size: startText[i].size, color: 0 } ));
				startTextList.add(ft[3] = new Text(startText[i].text, startText[i].x + 1, startText[i].y, { size: startText[i].size, color: 0 } ));
				startTextList.add(ft[4] = new Text(startText[i].text, startText[i].x, startText[i].y - 1, { size: startText[i].size, color: 0 } ));
				startTextList.add(ft[5] = new Text(startText[i].text, startText[i].x, startText[i].y + 1, { size: startText[i].size, color: 0 } ));
			}

			// re-populate graphiclist with text
			for (i = 0; i < startText.length; i ++) startTextList.add(startText[i]);

			// camera scrolling factors
			scoreTextList.scrollX = deadTextList.scrollX = scoreTextList.scrollY = deadTextList.scrollY = 0;
		}

		override public function update():void
		{
			// flashing text
			if (!Game.started || Game.dead)
			{
				t ++;
				if (t > 20)
				{
					if (ft[0].alpha == 1)
					{
						for (var i:int = 0; i < ft.length; i ++) ft[i].alpha = 0;
					}
					else
					{
						for (i = 0; i < ft.length; i ++) ft[i].alpha = 1;
					}
					t = 0;
				}
			}

			graphic = (Game.dead) ? deadTextList : ((Game.started) ? scoreTextList : startTextList);

			score = Math.floor(Game.score);
			scoreText.text = String(score) + "m";

			// populate graphiclist with text
			scoreTextList.add(scoreText);

			// right-align start text
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
			// reset flashing text
			ft[0].alpha = 0;
			t = 0;
			
			// reset death text widths to stop centring messing up // doesn't work ;~;
			for (var i:int = 0; i < 3; i ++) deadText[i].width = 0;

			// decide death text
			deadText[0].text = "YOU RAN " + String(score) + "m";
			deadText[1].text = (score < 1000) ? "YOU SUCK" : ((score < 3000) ? "YOU'RE PRETTY" : ((score < 5000) ? "YOU'RE REALLY" : "YOU'RE AMAZING"));
			deadText[2].text = (score < 1000 || score >= 5000) ? "AT RUNNING" : "GOOD AT RUNNING";

			// populate graphiclist with text
			for (i = 0; i < deadText.length; i ++) deadTextList.add(deadText[i]);

			// centre death text
			for (i = 0; i < deadText.length; i ++) deadText[i].x = (FP.width - deadText[i].width) / 2;

			// empty graphiclist
			deadTextList.removeAll();

			// populate graphiclist with text shadows
			for (i = 0; i < deadText.length; i ++)
			{
				deadTextList.add(ft[6] = new Text(deadText[i].text, deadText[i].x - 1, deadText[i].y, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(ft[7] = new Text(deadText[i].text, deadText[i].x + 1, deadText[i].y, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(ft[8] = new Text(deadText[i].text, deadText[i].x, deadText[i].y - 1, { size: deadText[i].size, color: 0 } ));
				deadTextList.add(ft[9] = new Text(deadText[i].text, deadText[i].x, deadText[i].y + 1, { size: deadText[i].size, color: 0 } ));
			}

			// re-populate graphiclist with text
			for (i = 0; i < deadText.length; i ++) deadTextList.add(deadText[i]);
		}

	}
}