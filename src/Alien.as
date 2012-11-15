package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Alien extends Entity 
	{
		private var spr:Spritemap = new Spritemap(A.gfxALIEN, 24, 13);
		private var v:Number = 0;
		private var a:Number = 0.1;
		private var crashed:Boolean = false;
		private var crash:Sfx = new Sfx(A.sndCRASH);
		
		public function Alien(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			layer = A.lyrALIEN;
			type = A.typALIEN;
			setHitbox(24, 13);
			
			graphic = spr;
			spr.add("spin", [0, 1, 2], 8);
			spr.add("crash", [3], 0);
			spr.play("spin");
		}
		
		override public function update():void
		{
			if (!crashed)
			{
				v += a;
				
				for (var i:int = 0; i < Math.abs(v); i ++)
				{
					if (!collide(A.typWALL, x, y + FP.sign(v))) 
					{
						y += FP.sign(v);
					}
					else
					{
						v = 0;
						crash.play();
						cameraShake.activateCameraJitter(8);
						crashed = true;
						spr.play("crash");
						break;
					}
				}
			}
			
			if (x < FP.camera.x - 24) FP.world.remove(this);
		}
		
	}

}