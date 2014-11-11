package characters 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Marko
	 */
	public class Flower extends FlxSprite 
	{
		[Embed(source="/images/flower.png")]
		private var image:Class;
		
		public function Flower(x:Number, y:Number) 
		{
			super(x, y, image); 
		}
		
	}

}