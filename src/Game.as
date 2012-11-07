package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	public class Game extends World 
	{
		public static var finished:Boolean = false;
		
		public function Game() 
		{	
			add(new Player(20, 20));
			
			add(new Wall(20, 40));
		}
		
	}

}