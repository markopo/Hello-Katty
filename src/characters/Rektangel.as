package characters 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Marko
	 */
	public class Rektangel extends FlxSprite 
	{
		[Embed(source = "/images/Rektangel.png")]
		private var image:Class; 
		
		
		public function Rektangel(x:Number, y:Number) 
		{
			super(x, y, image); 
			
			
			
			maxVelocity.x = 75; 
			maxVelocity.y = 75; 
		}
		
		
		public function crash(d:Number = 2):void 
		{	
			var vx:Number = velocity.x / d; 
			var vy:Number = velocity.y / d; 
			velocity.x = vx * -1; 
			velocity.y = vy * -1; 
		}
		
		
		override public function update():void 
		{
			if (this.x < 0) {		
				crash(3.5);  
			}

			if (this.x > Constants.GAME_WIDTH-30) {
				crash(3.5);  
			}

			if (this.y < 0) {
				crash(3.5);   
			}
			
			
			if (this.y > Constants.GAME_HEIGHT-40) {
				crash(0.9);  
			}
			
			if (velocity.x > -1 && velocity.x < 1) {
				velocity.x = 0; 
			}
			
			if (velocity.y > -1 && velocity.y < 1) {
				velocity.y = 0; 
			}
			
			
		
			super.update(); 
		}
		
	}

}