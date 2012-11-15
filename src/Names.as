package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;

	public class Names extends Entity 
	{
		private var a:Text = new Text("JAMIE BAYNE", 0, (FP.height / 2) - 6, { size: 8, color: 0xE6E4D5 } );
		private var t:int = 0;
		private var s:Sfx = new Sfx(A.sndJUMP);
		
		public function Names() 
		{
			a.x = (FP.width - a.width) / 2;
			graphic = a;
			s.play();
		}
		
		override public function update():void
		{
			t ++;
			if (t > 40 && a.text == "JAMIE BAYNE")
			{
				a.text = "JACK BROCKLEY";
				s.play();
			}
			if (t > 80 && a.text == "JACK BROCKLEY")
			{
				a.text = "BENJAMIN WELLS";
				s.play();
			}
			if (t > 120 && a.text == "BENJAMIN WELLS")
			{
				FP.world = new Game;
			}
			a.x = (FP.width - a.width) / 2;
		}
		
	}

}