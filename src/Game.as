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
		
		private var _walls:Array = new Array();
		private var _player:Player

		public function Game() 
		{	
			time = 0;

			_player = new Player(30, 4);
			_walls.push(new Wall(20,40,80,20));

			add(_player);
			add(_walls[0]);
			add(new HUD);

			TrackPlayer();
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.R)) FP.world = new Game;
			time += FP.elapsed;

			/* Wall management code. Could be better housed in Level.as or similar */
			_walls = RemoveNulls(_walls); //Remove any garbage-collected elements
			//Check wall positions and add/remove _walls as appropriate
			for (var index:String in _walls)
			{
				if(_walls[index].x < 0 + FP.camera.x - _walls[index].width)
				{
					remove(_walls[index]);
					_walls[index] = undefined;
				}
			}
			var lastWall:Wall = _walls[_walls.length - 1] //AS3 doesn't have an Array.last() function?
			if(lastWall.x + lastWall.width < FP.width + camera.x)
			{
				AddWall(lastWall);
			}
			
			super.update();

			TrackPlayer();
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
		private function AddWall(lastWall:Wall):void
		{
			var lWallHeight:int = lastWall.height;
			var lWallWidth:int = lastWall.width;

			var wallHeight:int = FP.rand(36) + 5; // 5 - 40

			if (wallHeight - lWallHeight < 0) {} //TODO make this work

			var wallGap: int = FP.rand(21) + 10; //10-30
			var wallWidth:int = FP.rand(61) + 40; // 40 - 100
			var x:int = FP.width + FP.camera.x + wallGap;
			var y:int = FP.height + FP.camera.y - wallHeight;

			var w:Wall = new Wall(x,y,wallWidth,wallHeight);
			_walls.push(w);
			add(w);
		}

		
		//Move the camera to the player's position
		private function TrackPlayer():void
		{
			//Could make this track y slightly with high jumps
			var _cameraXOffset:int = -4;
			FP.camera.x = _player.x + _cameraXOffset;
		}
	}

}
