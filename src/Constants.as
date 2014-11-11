package  
{
	import org.flixel.FlxG; 
	/**
	 * ...
	 * @author Marko
	 */
	public class Constants 
	{
		
		public function Constants() 
		{
		
		}
		
		public static const GAME_WIDTH:Number = 960; 
		public static const GAME_HEIGHT:Number = 640; 
		
		
		public static function GoToPlay():void 
		{
			if (FlxG.mouse.justPressed()) {
				
				FlxG.switchState(new PlayState()); 				
			}
		}
		
	}

}