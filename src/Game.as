package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Game extends World 
	{
		public static var time:Number;
		
		private var walls:Array = new Array();

		public function Game() 
		{	
			time = 0;

			add(new Player(30, 4));
			walls.push(new Wall(20,40,80,20));
			add(walls[0]);
			add(new HUD);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.R)) FP.world = new Game;
			time += FP.elapsed;

			/* Wall management code. Could be better housed in Level.as or similar */
			walls = RemoveNulls(walls); //Remove any garbage-collected elements
			//Check wall positions and add/remove walls as appropriate
			for (var index:String in walls)
			{
				if(walls[index].x < 0 + FP.camera.x - walls[index].width)
				{
					remove(walls[index]);
					walls[index] = undefined;
				}
			}
			var lastWall:Wall = walls[walls.length - 1] //AS3 doesn't have a Vector.last() function?
			if(lastWall.x + lastWall.width < FP.width + camera.x)
			{
				AddWall(lastWall);
			}
			
			super.update();
		}

		private function RemoveNulls(a:Array):Array //Used to be/should be provided in FP
		{
			var b:Array = [];
			for (var i:int = 0; i < a.length; ++i)
			{
				if(a[i] != undefined)
				{
					b.push(a[i]);
				}
			}
		
			return b;
		}

		//So doesn't belong here
		//Need to use last wall arg to place new wall in a nice place
		private function AddWall(var lastWall:Wall):void
		{
			var wallGap: int = FP.rand(21) + 10; //10-30
			var wallWidth:int = FP.rand(61) + 40; // 40 - 100
			var wallHeight:int = FP.rand(36) + 5; // 5 - 40
			var x:int = FP.width + FP.camera.x + wallGap;
			var y:int = FP.height + FP.camera.y - wallHeight;

			var w:Wall = new Wall(x,y,wallWidth,wallHeight);
			walls.push(w);
			add(w);
		}

		
	}

}
