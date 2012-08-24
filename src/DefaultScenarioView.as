package {
	import flash.text.TextField;
	import fl.controls.Button;

	import flash.display.MovieClip;
	
	import flash.sensors.Accelerometer;
	import flash.events.AccelerometerEvent;

	/**
	 * View controlada por DefaultScenarioController.
	 */
	public class DefaultScenarioView extends MovieClip {
		private var defaultScenarioController : DefaultScenarioController;
		public var wavesView : WavesView;
		public var pauseButton : Button;
		public var crn : ChronometerView;
		public var ammu : Ammunition;
		public var label : TextField;
		

		public function DefaultScenarioView() {
			
			defaultScenarioController = new DefaultScenarioController();
			defaultScenarioController.getView(this);
			
			setEventListeners(pauseButton);
			startGame();
		}

		private function setEventListeners(button : Button) : void {
			
			defaultScenarioController.setEventListeners(button);
			
		}

		private function startGame() : void {
			defaultScenarioController.startGame();         
		}
	}
}
