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
		public var speed:Point = new Point(0, 0);
		public var acceleration:Number = 0.5;
		public var friction:Number = 2;
		public var gravity:Number = 0.2;
		public var jump:Number = 2.5;
		public var maxspeed:Number = 0.5;
		
		public var spriteYou: Spritemap = new Spritemap(A.gfxPLAYER, 6, 9);
		
		public function Player(x:int, y:int) 
		{
			spriteYou.add("run", [0, 1], 4, true);
			spriteYou.play("run");
			spriteYou.originY = 1;
			
			this.x = x;
			this.y = y;
			
			graphic = spriteYou;
			
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("jump", Key.Z, Key.UP);
			
			setHitbox(6, 8);
		}
		
		override public function update():void
		{
			if (Input.check("left")) speed.x -= acceleration;
			if (Input.check("right")) speed.x += acceleration;
			
			if (Input.pressed("jump") && collide(A.typWALL, x, y + 1)) speed.y = -jump;
			if (!Input.check("jump") && speed.y < 0) speed.y += gravity;
			
			speed.y += gravity;
			
			for (var i:int = 0; i < Math.abs(speed.x); i ++)
			{
				if (!collide(A.typWALL, x + FP.sign(speed.x), y)) x += FP.sign(speed.x); 
				else speed.x = 0; 
			}
			for (i = 0; i < Math.abs(speed.y); i ++)
			{
				if (!collide(A.typWALL, x, y + FP.sign(speed.y))) y += FP.sign(speed.y);
				else speed.y = 0;
			}
			
			if (!Input.check("left") && !Input.check("right"))
			{
				if (speed.x > 0) 
				{ 
					speed.x -= friction;
					if (speed.x < 0) speed.x = 0;
				}
				if (speed.x < 0) 
				{
					speed.x += friction;
					if (speed.x > 0) speed.x = 0;
				}
			}
			
			if (Math.abs(speed.x) > maxspeed) speed.x = FP.sign(speed.x) * maxspeed;

			if (y > FP.height * 2) FP.world = new Game;
		}
		
	}

}