package {
	import fl.controls.Button;

	import flash.display.MovieClip;

	/**
	 * View controlada por DefaultScenarioController.
	 */
	public class DefaultScenarioView extends MovieClip {
		private var defaultScenarioController : DefaultScenarioController;
		public var wavesView : WavesView;
		public var pauseButton : Button;
		public var crn : ChronometerView;

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
