package characters 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Marko
	 */
	public class helloKitty extends FlxSprite 
	{
		
		
		
		[Embed(source = "/images/hellokitty.png")]
		private var HelloKittyImage:Class; 
		
		private var speed:Number = 5; 
		
		//private var speedBounceBackwards:Number = 5; 
		
		
		private var zoomCamera:ZoomCamera; 
		
		
		public function helloKitty(x:Number, y:Number) 
		{			
			super(x, y, HelloKittyImage); 
			acceleration.y = 50; 
			
			maxVelocity.x = 150; 
			maxVelocity.y = 150; 
			
		/*	zoomCamera = new ZoomCamera(this.x, this.y, Constants.GAME_WIDTH, Constants.GAME_HEIGHT, 1);
		    zoomCamera.target = this;	
			FlxG.resetCameras(zoomCamera); 
			
			*/
		}
		
		private function move():void 
		{	
			
			
			if (FlxG.keys.LEFT) {
			//	this.x -= speed; 	
				this.velocity.x -= speed; 
		//		trace("left"); 
			}
			
			if (FlxG.keys.RIGHT) {
			//	this.x += speed;
				this.velocity.x += speed;
		//		trace("right"); 
			}
			
			if (FlxG.keys.UP) {
			//	this.y -= speed; 
				this.velocity.y -= speed; 
			}
			
			if (FlxG.keys.DOWN) {
			//	this.y += speed; 
				this.velocity.y += speed; 
			}
		}
		
		private function velocityNull():void 
		{
			this.velocity.x = 0; 
			this.velocity.y = 0; 
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
				crash();  
			}

			if (this.x > Constants.GAME_WIDTH-30) {
				crash();  
			}

			if (this.y < 0) {
				crash();   
			}
			
			
			if (this.y > Constants.GAME_HEIGHT-40) {
				crash(0.85);  
			}

			move(); 
		
			super.update(); 
		}
		
				
		
		
		
	}

}