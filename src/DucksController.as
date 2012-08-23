package {
	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * Controlador dos patos.
	 * O construtor DucksController recebe uma referência de DucksView.
	 * O método onAnimation é responsável pelo movimento horizontal dos patos.
	 * O método showDuck é responsável por pegar um pato aleatório de view.ducksArray e movimentá-lo na vertical.
	 * O método hideDuck trata de descer um pato quando acertado e colocar outro no lugar dele chamando showDuck.
	 * O método randomNumber trata de escolher um número aleatório de 0 - 7, para escolha do pato no view.ducksArray.
	 * O método setCurrentIndex trata de modificar o currentIndex para impedir que o mesmo pato seja adicionado por 
	 * showDuck.
	 */
	public class DucksController extends Object {
		public var view : DucksView;
		private var currentIndex : int;
		private const DUCKSARRAYLOWINDEX : int = 0;
		private const DUCKSARRAYHIGHINDEX : int = 7;

		public function DucksController(view : DucksView) {
			this.view = view;
			showDuck();
		}

		public function onAnimation() : void {
			if (view.x > -1380) {
				view.x = view.x - 7;
			} else {
				view.x = 1280;
			}
		}

		public function showDuck() : void {
			var i : int;
			i = randomNumber(DUCKSARRAYLOWINDEX, DUCKSARRAYHIGHINDEX);
			trace("---------------------------------");
			trace("i:" + i);
			trace("Current Index:", +currentIndex);

			while (i == currentIndex) {
				i = randomNumber(DUCKSARRAYLOWINDEX, DUCKSARRAYHIGHINDEX);
				trace("sort again!");
			}

			trace("new i: " + i);
			trace("--------------------------------");
			if (i != currentIndex)
				TweenLite.to(view.ducksArray[i], 1, {y:-150});
		}

		public function hideDuck(e : MouseEvent) : void {
			TweenLite.to(e.currentTarget, 1, {y:0, onComplete:showDuck});
			setCurrentIndex(e);
		}

		public function setEventListeners(duck : MovieClip) : void {
			duck.addEventListener(MouseEvent.CLICK, hideDuck);
		}

		public function randomNumber(low : Number = 0, high : Number = 1) : Number {
			return Math.floor(Math.random() * (1 + high - low)) + low;
		}

		public function setCurrentIndex(e : MouseEvent) : void {
			// Iago, esse WARNING é normal?
			switch(e.currentTarget.name) {
				case 'duck1':
					currentIndex = 0;
					break;
				case 'duck2':
					currentIndex = 1;
					break;
				case 'duck3':
					currentIndex = 2;
					break;
				case 'duck4':
					currentIndex = 3;
					break;
				case 'duck5':
					currentIndex = 4;
					break;
				case 'duck6':
					currentIndex = 5;
					break;
				case 'duck7':
					currentIndex = 6;
					break;
				case 'duck8':
					currentIndex = 7;
					break;
			}
		}
	}
}
