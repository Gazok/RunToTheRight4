package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Game extends World 
	{
		
		public function Game() 
		{	
			add(new Player(40, 4));
			add(new Wall(20, 40, 80, 20));
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.R)) FP.world = new Game;
			
			super.update();
		}
		
	}

}