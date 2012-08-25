package {
	import flash.display.MovieClip;
	import flash.text.TextField;

	public class ChronometerView extends MovieClip {
		private var cron : ChronometerController;
		public var txtField : TextField;
		public var defaultScenarioView : DefaultScenarioView;
		public var finalScoreView : FinalScoreView;

		public function ChronometerView() {
			this.cron = new ChronometerController(txtField);
			this.defaultScenarioView  = new DefaultScenarioView();
			this.finalScoreView = new FinalScoreView();
		}

		public function continueTime() : void {
			cron.continueTime();
		}

		public function stopTime() : void {
			cron.stopTime();
		}
	}
}