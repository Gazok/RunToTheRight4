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
		[Embed(source = "../assets/graphics/background2.png")] static public const gfxBACKGROUNDTWO:Class;
		[Embed(source = "../assets/graphics/background3.png")] static public const gfxBACKGROUNDTHREE:Class;
		[Embed(source = "../assets/graphics/fern.png")] static public const gfxFERN:Class;
		[Embed(source = "../assets/graphics/mutebutton.png")] static public const gfxMUTEBUTTON:Class;
		[Embed(source = "../assets/graphics/ufoSheet.png")] static public const gfxALIEN:Class;

		// audio
		[Embed(source = '../assets/sound/music.mp3')] static public const sndBGMUSIC:Class;
		[Embed(source = '../assets/sound/jump.mp3')] static public const sndJUMP:Class;
		[Embed(source = '../assets/sound/die.mp3')] static public const sndDIE:Class;
		[Embed(source = '../assets/sound/crash.mp3')] static public const sndCRASH:Class;

		// collision types
		static public const typWALL:String = "wall";
		static public const typFERN:String = "fern";
		static public const typMUTEBUTTON:String = "mb";
		static public const typALIEN:String = "alien";

		// graphic layers
		static public const lyrMUTEBUTTON:int = -5;
		static public const lyrALIEN:int = -10;
		static public const lyrEXPLOSION:int = -15;
		static public const lyrHUD:int = -20;

		// fonts
		// [Embed(source = '../assets/misc/font.ttf', fontName = 'fntFONT', embedAsCFF='false', fontFamily = 'default')] private const F1:Class;
	}

}