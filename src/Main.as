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
			FP.screen.color = 0x909090;
			FP.screen.scale = 10;
			FP.console.enable(); 
		}
	}
}
