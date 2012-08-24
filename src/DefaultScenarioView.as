package {
	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * View controlada por DefaultScenarioController.
	 */
	public class DefaultScenarioView extends MovieClip {
		
		private var defaultScenarioController : DefaultScenarioController;
		public var wavesView : WavesView;
		public var pauseButton : MovieClip;
		public var crn : ChronometerView;
		public var ammu : Ammunition;
		public var label : TextField;
		public var pauseMenuView : PauseMenuView = new PauseMenuView();
		

		public function DefaultScenarioView() {
			
			defaultScenarioController = new DefaultScenarioController();
			defaultScenarioController.getView(this);
			
			setEventListeners(pauseButton);
			startGame();
		}

		private function setEventListeners(mc : MovieClip) : void {
			
			defaultScenarioController.setEventListeners(mc);
		}

		private function startGame() : void {
			defaultScenarioController.startGame();         
		}
	}
}
