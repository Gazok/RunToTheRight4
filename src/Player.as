package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Player extends Entity 
	{
		private var _toMove:Point = new Point(0, 0);
		private var _vel:Point = new Point(0, 0);
		private var _acc:Point = new Point(0.005, 0);
		private const _friction:Number = 2;
		private const _gravity:Number = 0.2;
		private const _jump:Number = -2.5;
		//private var maxspeed:Number = 0.5;
		
		private var spr:Spritemap = new Spritemap(A.gfxPLAYER, 6, 10);
		
		public function Player(x:int, y:int) 
		{
			spr.add("run", [0, 1, 2, 3], 8, true);
			spr.play("run");
			spr.originX = 1;
			spr.originY = 1;
			spr.originX = 1;
			
			this.x = x;
			this.y = y;
			
			graphic = spr;

			_vel.x = 1;
			
			Input.define("left", Key.LEFT, Key.A);
			Input.define("right", Key.RIGHT, Key.D);
			Input.define("jump", Key.Z, Key.UP, Key.W, Key.SPACE);
			
			setHitbox(4, 9);
			type = "player";
		}
		
		override public function update():void
		{
			/*if (Input.check("left")) _vel.x = 0
			if (Input.check("right")) _vel.x = 4;*/ //Could make left stop player, right speed up. Need camera manip.
			
			_acc.y = _gravity;
			if (Input.pressed("jump") && collide(A.typWALL, x, y + 1))
			{
				_acc.y += _jump;
			}
			else if (Input.check("jump") && _vel.y < 0)
			{
				_acc.y += -_gravity*0.5; //A bit generous
			}
			
			//Increase speed
			_vel.x += _acc.x;
			_vel.y += _acc.y;

			_toMove.x += _vel.x;
			_toMove.y += _vel.y;

			//Move the player 1 pixel at a time
			for (var i:int = 0; i < Math.abs(_toMove.x); i ++)
			{
				if (!collide(A.typWALL, x + FP.sign(_toMove.x), y))
				{
					x += FP.sign(_toMove.x);
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

			//Prevent quantized velocities
			_toMove.x -= Math.floor(_toMove.x);
			_toMove.y -= Math.floor(_toMove.y);
			
			/*if (!Input.check("left") && !Input.check("right"))
			{
				if (_vel.x > 0) 
				{ 
					_vel.x -= _friction;
					if (_vel.x < 0) _vel.x = 0;
				}
				if (_vel.x < 0) 
				{
					_vel.x += _friction;
					if (_vel.x > 0) _vel.x = 0;
				}
			}*/
			
			//if (Math.abs(_vel.x) > maxspeed) _vel.x = FP.sign(_vel.x) * _maxspeed;
		}
		
	}

}
