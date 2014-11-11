package  
{
	import org.flixel.FlxText;
	import flash.utils.getTimer; 
	
	/**
	 * ...
	 * @author Marko
	 */
	public class TimerLabel extends FlxText 
	{
		private var startTime:int; 
		private var currentTime:int; 
		private var timeRunning:int; 
		
		
		private var minutes:int; 
		private var seconds:int; 
		
		private var minStr:String; 
		private var secStr:String; 
		
		public function TimerLabel(x:Number, y:Number) 
		{
			super(x, y, 100, null, false); 
			
			startTime = getTimer(); 
			
			this.setFormat("Georgia", 24, GameColors.Yellow, "center"); 
		}
		
		
		private function calcTime():void 
		{
			currentTime = getTimer();
			timeRunning = (currentTime - startTime) * 0.001;
		}
		
		
		public function writeTime():void 
		{
			calcTime(); 
			minutes = Math.floor(timeRunning / 60) 
			seconds = timeRunning % 60;  
			
			if (minutes < 10) {
				minStr = "0" + minutes.toString(); 
			}
			else {
				minStr = minutes.toString(); 
			}
			
			if (seconds < 10) {
				secStr = "0" + seconds.toString(); 
			}
			else {
				secStr = seconds.toString(); 
			}
			
			this.text = minStr + ":" + secStr; 
			
			
		}
		
		
		
	}

}