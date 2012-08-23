package 
 {
	import flash.display.Sprite;


	public class Main extends Sprite
	{
		private var mainMenuView : MainMenuView;
		
		public function Main()
		{
			mainMenuView = new MainMenuView();
			addChild(mainMenuView);
		}
	}
}
