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
	public class GameOverState extends FlxState
	{
		
		[Embed(source="/images/green-grass.jpg")]
		private var Grass:Class; 
		
		private var text:String; 
		
		public function GameOverState(text:String) 
		{
			this.text = text; 
			
			super(); 
		}
		
		override public function create():void {
			
			var grass:FlxSprite = new FlxSprite(0, 0, Grass); 
			add(grass); 
			
			var label:FlxText = new FlxText(50, 50, 700, "GAME OVER", false);
			label.setFormat("Georgia", 65, GameColors.White, "center"); 
			add(label); 
			
			
			var label2:FlxText = new FlxText(50, 150, 700, text, false);
			label2.setFormat("Georgia", 45, GameColors.White, "center"); 
			add(label2); 
			
			var label3:FlxText = new FlxText(50, 250, 700, "Vill du spela igen?", false);
			label3.setFormat("Georgia", 45, GameColors.White, "center"); 
			add(label3); 
			
		}
		
		
		override public function update():void  
		{
			Constants.GoToPlay(); 
			
			super.update(); 
		}
		
		
		
	}

}