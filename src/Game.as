package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	public class Game extends World 
	{
		public static var score:int;
		public static var started:Boolean = false; // only show start screen before first run
		public static var dead:Boolean;
		public static var bgMusic:Sfx = new Sfx(A.sndBGMUSIC);
		
		public static const friction:Number = 2;
		public static const gravity:Number = 0.2;

		private var _walls:Array = new Array();
		private var _player:Player;

		public function Game() 
		{	
			score = 0;
			dead = false;

			_player = new Player(4, 31);
			_walls.push(new Wall(-8, 40, 176, 20));

			add(_player);
			add(_walls[0]);
			add(new HUD);

			TrackPlayer();
			if (!bgMusic.playing) bgMusic.loop();
			if (started) _player.spr.play("run");
		}
		
		override public function update():void
		{
			super.update();
			
			if (!started)
			{
				if (Input.pressed(Key.SPACE))
				{
					started = true;
					_player.spr.play("run");
				}
			}
			else
			{
				//Create explosions
				if (Math.random()*100 > 85 && !Game.dead)
				{
					add(new Explosion(0, Math.random()*45));
				}
				if (Math.random()*100 > 50 && Game.dead)
				{
					add(new Explosion(Math.random()*75, Math.random()*45));
				}
				
				if (Input.pressed(Key.R))
				{ 
					Restart();
				}

				if (!dead) score += FP.elapsed;

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
				var lastWall:Wall = _walls[_walls.length - 1]; //AS3 doesn't have an Array.last() function?
				if(lastWall.x + lastWall.width < FP.width + camera.x)
				{
					var w:Wall = GenerateWall(lastWall);
					_walls.push(w);
					add(w);
				}
				//End wall management

				TrackPlayer();

				if(_player.y >= FP.height)
				{
					_player.vel.x = 0;
					dead = true;
				}
				
				if (dead && Input.pressed(Key.SPACE)) Restart();
			}
		}

		public function Restart():void
		{
			FP.world = new Game();
		}

		private function RemoveNulls(a:Array):Array //Used to be provided in FP
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

		//---GenerateWall
		//   Args: lastWall - The wall to base the new wall from
		//
		//   Generates wall coordinates, then checks them against
		//   trajectory of the player. If wall is rejected, function
		//   recurs until a valid wall is created, which is then returned
		//   to the callers.
		//   (So doesn't belong here)
		private function GenerateWall(lastWall:Wall):Wall
		{
			//Last wall information
			var lWallX:int = lastWall.x;
			var lWallHeight:int = lastWall.height;
			var lWallWidth:int = lastWall.width;
			
			//New wall container
			var newWall:Wall = undefined;

			//New wall information
			var wallHeight:int = FP.rand(36) + 5; // 5 - 40
			var wallGap:int = FP.rand(31) + 15; // 15 - 45
			var wallX:int = FP.width + FP.camera.x + wallGap;
			var wallY:int = FP.height + FP.camera.y - wallHeight;

			//Get player information
			const playerX:int = _player.x;
			const playerY:int = _player.y;
			const playerWidth:int = _player.width;
			const playerHeight:int = _player.height;
			const distX:int = lWallX - playerX;
			const uX:Number = _player.VelXAfterDistance(distX);
			const uY:Number = Game.gravity - _player.jump;
			const aX:Number = _player.acc.x;
			const aY:Number = Game.gravity - _player.ease;

			const playerDistToWall:Number = wallGap - playerWidth;

			//Simple mechanics rendered nasty.
			const t:Number = 2*playerDistToWall/(Math.sqrt(Math.pow(uX,2)+2*aX*(playerDistToWall)) + uX);

			const nY:Number = uY*t+0.5*(aY*Math.pow(t,2));

			if (nY - playerHeight < wallY)
			{
				newWall = GenerateWall(lastWall);
				FP.console.log("Wall Rejected: " + (String)(wallY - nY));
			}
			else
			{
				var wallWidth:int = FP.rand(201) + 50; // 50 - 250

				newWall = new Wall(wallX,wallY,wallWidth,wallHeight);
			}

			return newWall;
		}

		//Move the camera to the player's position
		private function TrackPlayer():void
		{
			//Could make this track y slightly with high jumps
			var _cameraXOffset:int = -4;
			FP.camera.x = _player.x + _cameraXOffset -10;
		}
	}
}
