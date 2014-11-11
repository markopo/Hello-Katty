package  
{
	import characters.Flower;
	import characters.helloKitty;
	import characters.Rektangel;
	import flash.utils.Timer;
	import mx.core.FlexSprite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState; 
	import org.flixel.FlxSprite; 
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxG;
	import org.flixel.FlxObject; 
	
	
	/**
	 * ...
	 * @author Marko
	 */
	public class PlayState extends FlxState
	{
		[Embed(source="/images/green-grass.jpg")]
		private var Grass:Class; 
		
		private var flowers:FlxGroup; 
		private var flower:Flower; 
		
		private var coords:Array; 
		
		private var rektangles:FlxGroup; 
		private var rektangle:Rektangel; 
		
		private var scoreCardLabel:ScoreCard; 
		private var timerLabel:TimerLabel;  
		
		
		private var hellokitty:helloKitty; 
		
		private var numFlowers:int = 20; 
		
	
		public function PlayState() 
		{
			
			super(); 
		}
		
		override public function create():void {
			var grass:FlxSprite = new FlxSprite(0, 0, Grass); 
			add(grass); 
			
			scoreCardLabel = new ScoreCard(10, 5, 100); 
			add(scoreCardLabel); 
			
			timerLabel = new TimerLabel(Constants.GAME_WIDTH - 100, 10);
			add(timerLabel); 
			
			addFlowers(); 
			
			addRectangles(); 
		
			hellokitty = new helloKitty(50, 50); 
			add(hellokitty); 
			
			
		
		}
		
		
		
		override public function update():void  
		{
			FlxG.collide(hellokitty, flowers, collisionHelloKittyWithFlowers); 
			
			FlxG.collide(hellokitty, rektangles, collisionHelloKittyWithRektangles); 
			
			FlxG.collide(rektangles, rektangles, collisionRektToRekt); 
			
			timerLabel.writeTime(); 

			
			super.update(); 
		}
		
		
		
		
		private function  addFlowers():void 
		{
			flowers = new FlxGroup(); 
			coords = new Array(); 
			
			for (var i:int = 0; i < numFlowers; i++) {
				var x:Number = Math.random() * (Constants.GAME_WIDTH-80); 
				var y:Number = Math.random() * (Constants.GAME_HEIGHT-80); 
				
				var c:Object = new Object(); 
				c.x = x; 
				c.y = y; 
				coords.push(c); 
				
				flower = new Flower(x, y);  
				flowers.add(flower); 			
				add(flower); 
			}
		}
		
		private function addRectangles():void {
			
			rektangles = new FlxGroup(); 
			
			for (var i:int = 0; i < coords.length; i++) {
				for (var j:int = 1; j < 3;j++){
					var f:Object = coords[i]; 				 
					var vx:Number = 75 * j;  
					var x:Number = f.x + vx;  
					var y:Number = f.y + 50; 
					rektangle = new Rektangel(x, y); 
					rektangles.add(rektangle); 
					add(rektangle); 
				}
			}
			
		}
		
		
		private function collisionHelloKittyWithFlowers(hk:FlxSprite, f:FlxSprite):void 
		{
			var flower:Flower = f as Flower; 
			flowers.remove(flower); 
			flower.kill(); 
			
			var hellokitty:helloKitty = hk as helloKitty; 
			hellokitty.crash(); 
			
			
			scoreCardLabel.addScore(); 
			
			if (scoreCardLabel.getScore() == numFlowers) {
				GameOver(); 
			}
										
		}
		
		private function collisionHelloKittyWithRektangles(hk:FlxSprite, r:FlxSprite):void 
		{
			var rekt:Rektangel = r as Rektangel; 
			
			var hellokitty:helloKitty = hk as helloKitty; 
			hellokitty.crash(); 
			
			rekt.velocity.x = hellokitty.velocity.x * -1; 
			rekt.velocity.y = hellokitty.velocity.y * -1; 
						
		}
		
		private function collisionRektToRekt(r1:Rektangel, r2:Rektangel):void 
		{
		  var v1x:Number =	r1.velocity.x * -1; 
		  var v1y:Number = r1.velocity.y * -1; 
		  
		  var v2x:Number = r2.velocity.x * -1; 
		  var v2y:Number = r2.velocity.y * -1; 
		  
		  r1.velocity.x = v1x; 
		  r1.velocity.y = v1y;
		  
		  r2.velocity.x = v2x;
		  r2.velocity.y = v2y; 
		}
	
		
		
		private function GameOver():void {
			var text:String = "Du fick " + scoreCardLabel.text + " på tiden " + timerLabel.text + "."; 
			FlxG.switchState(new GameOverState(text)); 
		}
		
		
	}

}