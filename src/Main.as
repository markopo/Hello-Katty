package 
{
	import org.flixel.*; 
	import org.flixel.FlxBasic;
	import org.flixel.FlxGame;
	
	/*
	 * http://gotoandlearn.com/play.php?id=138
		 * 
		 * 
		 * http://flashgamedojo.com/wiki/index.php?title=EZPlatformer_%28Flixel%29#Step_8:_Updating_The_Player
	 */
	[SWF(width="960", height="640")]
	public class Main extends FlxGame {
		
		public function Main():void 
		{
			super(Constants.GAME_WIDTH, Constants.GAME_HEIGHT, MenuState, 1); 
		}
		
		
	}
	
}