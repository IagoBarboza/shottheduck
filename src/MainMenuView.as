package {
	import flash.display.MovieClip;

	/**
	 * @author Ibs
	 */
	public class MainMenuView extends MovieClip {
		public var mainMenuController : MainMenuController;
		public var newGameButton : MovieClip;
		public var recordsButton : MovieClip;

		public function MainMenuView() {
			this.x = 512;
			this.y = 300;

			mainMenuController = new MainMenuController(this);

			setEventListener(newGameButton);
			setEventListener(recordsButton);
		}

		private function setEventListener(mc : MovieClip) : void {
			mainMenuController.setEventListener(mc);
		}
	}
}
