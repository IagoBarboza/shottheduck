package {
	import flash.display.MovieClip;
	
	public class MainMenuView extends MovieClip {
		
		public var newGameButton : MovieClip;
		public var recordsButton : MovieClip;
		private var mainMenuController : MainMenuController;
		
		public function MainMenuView() {
			
			this.x = 512;
			this.y = 300;
			
			mainMenuController = new MainMenuController(this);
			//mainMenuController.getView(this);
			setEventListener(newGameButton);
			//setEventListener(resumeGameButton);
			//setEventListener(recordsButton);
			//setEventListener(quitButton);
	
		}
		
		public function setEventListener(button : MovieClip) : void{
			 mainMenuController.setEventListener(button);
		}
	}
	
}
