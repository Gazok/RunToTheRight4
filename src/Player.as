package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Player extends Entity 
	{
		private var _toMove:Point = new Point(0, 0);
		private var _vel:Point = new Point(0, 0);
		private var _acc:Point = new Point(0.005, 0);
		private const _jump:Number = -2.5;
		private const _ease:Number = -0.5*Game.gravity;
		
		private var jumpSnd:Sfx = new Sfx(A.sndJUMP);
		
		public var spr:Spritemap = new Spritemap(A.gfxPLAYER, 6, 10);

		public function set vel(v:Point):void
		{
			if(x < 0) { x = 0; }
			_vel.x = x;
			_vel.y = y;
		}
		public function get vel():Point { return _vel; }
		public function get acc():Point { return _acc; }
		public function get ease():Number { return _ease; }
		public function get jump():Number { return _jump; }

		public function VelXAfterDistance(dist:int):Number
		{
			return Math.sqrt(Math.pow(_vel.x,2)+2*_acc.x*dist);
		}

		public function Player(x:int, y:int) 
		{
			spr.add("run", [0, 1, 2, 3], 8, true);
			spr.originX = 1;
			spr.originY = 1;
			
			this.x = x;
			this.y = y;
			
			graphic = spr;

			_vel.x = 1;
			
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
			Input.define("jump", Key.Z, Key.UP, Key.W, Key.SPACE);
			
			setHitbox(4, 9);
			type = "player";
			layer = A.lyrPLAYER;
		}
		
		override public function update():void
		{
			//Increase speed
			if (Game.started) 
			{
				_acc.y = Game.gravity;
				if (Input.pressed("jump") && collide(A.typWALL, x, y + 1))
				{
					_acc.y += _jump;
					jumpSnd.play();
				}
				else if (Input.check("jump"))// && _vel.y < 0)
				{
					_acc.y += _ease; //A bit generous
				}
				
				if (collide(A.typFERN, x, y))
				{
					_vel.x -= 10 * _acc.x;
					if (_vel.x < 0.1) _vel.x = 0.1;
				}
				else _vel.x += _acc.x;
				_vel.y += _acc.y;
				_toMove.x += _vel.x;
				_toMove.y += _vel.y;

				if (!Game.dead)
				{
					//Move the player 1 pixel at a time
					for (var i:int = 0; i < Math.abs(_toMove.x); i ++)
					{
						if (collide(A.typALIEN, x + FP.sign(_toMove.x), y))
						{
							Game.dieSnd.play();
							vel.x = 0;
							spr.visible = false;
							Game.dead = true;
							HUD.die();
						}
						else if (!collide(A.typWALL, x + FP.sign(_toMove.x), y))
						{
							x += FP.sign(_toMove.x);
							Game.score++;
						}
						else 
						{
							_vel.x = 0;
						}
					}
					for (i = 0; i < Math.abs(_toMove.y); i ++)
					{
						if (!collide(A.typWALL, x, y + FP.sign(_toMove.y))) 
						{
							y += FP.sign(_toMove.y);
						}
						else
						{
							_vel.y = 0;
						}
					}
				}
			}

			//Prevent quantized velocities
			_toMove.x -= Math.floor(_toMove.x);
			_toMove.y -= Math.floor(_toMove.y);
		}
	}
}
