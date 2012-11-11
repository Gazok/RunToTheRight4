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
		public static var speed:Number;
		
		public function Game() 
		{	
			time = 0;
			speed = 1;
			
			add(new HUD);
			
			add(new Player(40, 4));
			add(new Wall(20, 40, 80, 20));
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.R)) FP.world = new Game;
			
			time += FP.elapsed;
			
			super.update();
		}
		
	}

}