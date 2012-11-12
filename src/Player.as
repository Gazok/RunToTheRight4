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
		private var _vel:Point = new Point(0, 0);
		private var _acc:Point = new Point(0.005, 0);
		private var _friction:Number = 2;
		private var _gravity:Number = 0.2;
		private var _jump:Number = -2.5;
		//private var maxspeed:Number = 0.5;
		
		private var spriteYou: Spritemap = new Spritemap(A.gfxPLAYER, 6, 9);
		
		public function Player(x:int, y:int) 
		{
			spriteYou.add("run", [0, 1], 4, true);
			spriteYou.play("run");
			spriteYou.originX = 1;
			
			this.x = x;
			this.y = y;
			
			graphic = spriteYou;

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
				_acc.y += -0.05;
				FP.console.log("It happened");
			}
			

			//Increase speed
			_vel.x += _acc.x;
			_vel.y += _acc.y;

			//Move the player 1 pixel at a time
			//Could better represent motion with one loop checking x and y vs i
			//(Not a problem for small x/y)
			for (var i:int = 0; i < Math.abs(_vel.x); i ++)
			{
				if (!collide(A.typWALL, x + FP.sign(_vel.x), y)) x += FP.sign(_vel.x); 
				else _vel.x -= Math.floor(_vel.x); //Prevent quantized velocities
			}
			for (i = 0; i < Math.abs(_vel.y); i ++)
			{
				if (!collide(A.typWALL, x, y + FP.sign(_vel.y))) y += FP.sign(_vel.y);
				else _vel.y -= Math.floor(_vel.y);
			}
			
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
