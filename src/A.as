package  
{

	public class A 
	{
		// graphics
		[Embed(source = '../assets/graphics/characterSheet.png')] static public const gfxPLAYER:Class;
		[Embed(source = "../assets/graphics/explosionSheet.png")] static public const gfxEXPLOSION:Class;
		[Embed(source = "../assets/graphics/wallMiddle.png")] static public const gfxWALLMIDDLE:Class;
		[Embed(source = "../assets/graphics/wallLeft.png")] static public const gfxWALLLEFT:Class;
		[Embed(source = "../assets/graphics/wallRight.png")] static public const gfxWALLRIGHT:Class;
		[Embed(source = "../assets/graphics/background.png")] static public const gfxBACKGROUND:Class;

		// audio
		[Embed(source = '../assets/sound/music.mp3')] static public const sndBGMUSIC:Class;
		[Embed(source = '../assets/sound/jump.mp3')] static public const sndJUMP:Class;

		// collision types
		static public const typWALL:String = "wall";

		// graphic layers
		// static public const lyrDEPTH:int = depth;

		// fonts
		// [Embed(source = '../assets/misc/font.ttf', fontName = 'fntFONT', embedAsCFF='false', fontFamily = 'default')] private const F1:Class;
	}

}