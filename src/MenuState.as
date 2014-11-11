package  
{
	import org.flixel.FlxG; 
	import org.flixel.FlxState; 
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Marko
	 */
	public class MenuState extends FlxState
	{
		[Embed(source="/images/green-grass.jpg")]
		private var Grass:Class; 
		
		
		public var gameTitle:String = "Hallå Katty plockar maskrosor i Hisingsparken!"; 
		
		public function MenuState() 
		{
			super(); 
		}
		
		
		override public function create():void 
		{
			var grass:FlxSprite = new FlxSprite(0, 0, Grass); 
			add(grass); 
			
			var logo:FlxText = new FlxText(20, 20, 900, gameTitle, false); 
			logo.setFormat("Gergia", 40, GameColors.White, "center"); 
			add(logo); 
		}
		
		override public function update():void 
		{
			
			Constants.GoToPlay(); 
			
			super.update(); 
		}
		
		
		
	}

}