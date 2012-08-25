package {
	import flash.events.Event;
	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Ibs
	 */
	public class MainMenuController extends Object {
		
		public var view : MainMenuView;
		private var e:Event;
		public var defaultScenarioView : DefaultScenarioView;
		
		public function MainMenuController(view : MainMenuView) {
			this.view = view;
			inButtonAnimation(e);
		}
		
		public function setEventListener(mc:MovieClip) : void{
			switch(mc.name){
				case "newGameButton":
					mc.addEventListener(MouseEvent.CLICK, outButtonAnimation);
				break;
				
//				case "recordsButton":
//					mc.addEventListener(MouseEvent.CLICK, outButtonAnimation)
//				break;
			}
		}
		
		private function inButtonAnimation(e:Event) : void {
			
			TweenLite.to(view.newGameButton, 2, {y:-74});
			TweenLite.to(view.recordsButton, 2, {y:110});
		}
		
		private function outButtonAnimation(event : MouseEvent) : void {
			//vefificar quem disparou o evento pra chamar 
			TweenLite.to(view.newGameButton, 2, {y:110});
			TweenLite.to(view.recordsButton, 2, {y:300, onComplete:onDefaulScenarioView});
		}
		
		private function onDefaulScenarioView() : void {
			defaultScenarioView = new DefaultScenarioView();
			view.addChild(defaultScenarioView);
//			defaultScenarioView.addEventListener("onMainMenu", inButtonAnimation);
		}
	}
}
