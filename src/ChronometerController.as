package {
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;

	/**
	 * @author Priscilla
	 */
	public class ChronometerController extends Object{
		private var timer : Timer;
		private var count : Number = 120;  // Count: 2 minutos
		private var delay : Number = 1000; // Delay:  1 seg.
		public var txtField : TextField;

		public function ChronometerController(txtField : TextField) : void {
			this.txtField  = txtField;
			timer = new Timer(delay,count);
			timer.addEventListener(TimerEvent.TIMER, showTime);
			timer.start();
		}

		public function showTime(e : TimerEvent) : void {
			txtField.text = stringTime((count)-timer.currentCount);
		}
		
		private function stringTime(time : Number) : String {
			var seconds:int = time % 60;
			var minutes:int =  time / 60;
			
			var sec:String = String(seconds);
			var min:String = String(minutes);
			
			if(seconds <= 9)
				sec = "0"+sec;
				
			if(minutes <= 9)
				min = "0"+min;
				
			return min + ":" +sec;
		}
		
		public function stopTime() : void{
			timer.stop();
		}
		
		public function continueTime() : void{
			timer.start();
		}
	}
}
