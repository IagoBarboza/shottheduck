package {
	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * Controlador de MainMenuView.
	 * 
	 */
	// Iago, precisamos dar última olhada nessa classe.
	public class MainMenuController extends Object {
		private var view : MainMenuView;
		private var defaultScenarioView : DefaultScenarioView;

		public function MainMenuController(view : MainMenuView) {
			
			this.view = view;
			inButtonAnimation();
		}

		public function setEventListener(button : MovieClip) : void {
			
			switch(button.name) {
				case 'newGameButton':
					button.addEventListener(MouseEvent.CLICK, outButtonAnimation);
					break;
			}
		}

		private function inButtonAnimation() : void {
			
			TweenLite.to(view.newGameButton, 2, {y:-74});
			TweenLite.to(view.recordsButton, 2, {y:110});
		}

		private function outButtonAnimation(event : MouseEvent) : void {
		
			TweenLite.to(view.newGameButton, 2, {y:110});
			TweenLite.to(view.recordsButton, 2, {y:300, onComplete:onDefaulScenarioView});
		}

		private function onDefaulScenarioView() : void {
			defaultScenarioView = new DefaultScenarioView();
			view.addChild(defaultScenarioView);
		}

		// Iago, precisaremos desse método? Vamos ver amanhã.
		private function onRecordsView() : void {
			trace("on records view");
		}
	}
}
