package  
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	public class Main extends Engine
	{
		
		public function Main()
		{
			super(80, 60);
		}
		
		override public function init():void 
		{
			FP.world = new Game;
			//FP.console.enable();
			
			FP.screen.scale = 10;
		}
		
	}
	
}