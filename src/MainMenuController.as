package {
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Ibs
	 */
	public class MainMenuController extends Object {
		
		private var view : MainMenuView;
		private var defaultScenarioView : DefaultScenarioView;
		
		
		public function MainMenuController(view : MainMenuView) {
			this.view = view;
			inButtonAnimation();
		}
		
		
		public function setEventListener(button : MovieClip) : void{
			
			switch(button.name){
				
				case 'newGameButton':
					button.addEventListener(MouseEvent.CLICK, outButtonAnimation);
				break;
			}
				
		}
		
		private function inButtonAnimation() : void{
			
			TweenLite.to(view.newGameButton, 2,{y:-74});
			TweenLite.to(view.recordsButton, 2,{y:110});
		}

		private function outButtonAnimation(event : MouseEvent) : void {
			
			//switch(event.currentTarget){
				//case 'newGameButton':
						TweenLite.to(view.newGameButton, 2, {y:110});
						TweenLite.to(view.recordsButton, 2, {y:300, onComplete:onDefaulScenarioView});
				//break;	
				
				//case 'recordsButton':
				//		TweenLite.to(view.newGameButton, 2, {y:110});
				//		TweenLite.to(view.recordsButton, 2, {y:300, onComplete:onRecordsView});
				//break;
				
			//}
			
		}

		private function onDefaulScenarioView() : void {
			defaultScenarioView = new DefaultScenarioView();
			view.addChild(defaultScenarioView);
		}
		
		private function onRecordsView() : void{
			trace("on records view");
		}

	}
}
