package {
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * @author Priscilla
	 */
	public class ChronometerView extends MovieClip {
		private var cron : ChronometerController;
		public var txtField : TextField;
		
		public function ChronometerView(){
			cron = new ChronometerController(txtField);
		}
		
		public function continueTime() : void {
			cron.continueTime();
		}
		
		public function stopTime() : void {
			cron.stopTime();
		}
	}
}
