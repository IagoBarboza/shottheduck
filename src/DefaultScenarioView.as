package {
	import flash.display.MovieClip;

	/**
	 * @author Ibs
	 */
	public class DefaultScenarioView extends MovieClip {
			
		private var defaultScenarioController : DefaultScenarioController;	
		
		public var wavesView : WavesView;
		public var pauseButton : MovieClip;
		public var crn : ChronometerView;
		public var scoreView : CurrentScoreView;
		public var ammuView : AmmunitionView;
		//public var label : TextField;
		public var pauseMenuView : PauseMenuView;
		public var finalScoreView : FinalScoreView;
		
		
		public function DefaultScenarioView() {
			pauseMenuView = new PauseMenuView();
			defaultScenarioController = new DefaultScenarioController(this);
			setEventListeners(pauseButton);
			startGame();
		}

		public function setEventLister(mc:MovieClip):void{
			defaultScenarioController.setEventListener(mc);
		}
		
		public function startGame() : void {
			defaultScenarioController.startGame();         
		}
		
		private function setEventListeners(mc : MovieClip) : void {
			defaultScenarioController.setEventListener(mc);
		}
		
		public function showFinalScoreView():void{
			defaultScenarioController.showFinalScoreView();
		}
		
	}
}
