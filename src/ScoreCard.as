package  
{
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Marko
	 */
	public class ScoreCard extends FlxText 
	{
		private var Score:int;
		
		public function ScoreCard(x:Number, y:Number, width:Number) 
		{
			super(x, y, width); 
			
			Score = 0; 
		}
		
		public function getScore():int 
		{
			return Score; 
		}
		
		 
		
		public function addScore():void 
		{
			Score += 1;
			writeScore(); 
		} 
		
		public function writeScore():void 
		{
			this.text = "score: " + Score.toString(); 
		}
		
		
	}

}