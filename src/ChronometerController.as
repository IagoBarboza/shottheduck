package {
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;

	public class ChronometerController extends Object {
		private var timer : Timer;
		private const COUNT : Number = 120;
		private const DELAY : Number = 1000;
		public var txtField : TextField;
		public var defaultScenarioView : DefaultScenarioView;

		public function ChronometerController(txtField : TextField) : void {
			this.txtField = txtField;
			timer = new Timer(DELAY, COUNT);
			timer.addEventListener(TimerEvent.TIMER, showTime);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, showFinalScoreView);
			timer.start();
		}

		private function showFinalScoreView(event : TimerEvent) : void {
			defaultScenarioView.showFinalScoreView();
		}

		public function showTime(e : TimerEvent) : void {
			txtField.text = stringTime((COUNT) - timer.currentCount);
		}

		private function stringTime(time : Number) : String {
			var seconds : int = time % 60;
			var minutes : int = time / 60;

			var sec : String = String(seconds);
			var min : String = String(minutes);

			if (seconds <= 9)
				sec = "0" + sec;

			if (minutes <= 9)
				min = "0" + min;

			return min + ":" + sec;
		}

		public function stopTime() : void {
			timer.stop();
		}

		public function continueTime() : void {
			timer.start();
		}
	}
}