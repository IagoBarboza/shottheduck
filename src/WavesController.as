package {
	import com.greensock.TweenLite;

	/**
	 * Controlador do movimento das ondas.
	 * Controlador de WavesView.
	 * O método onWavesAnimation começa a animação.
	 * O método offWavesAnimation termina a animação.
	 * O método onDucksAnimation chama o onAnimation de cada DucksView.
	 */
	public class WavesController extends Object {
		public var view : WavesView;
		public var animate : Boolean = true;
		private var state : int = 100;

		public function WavesController() {
		}

		public function getView(view : WavesView) : void {
			this.view = view;
		}

		public function onWavesAnimation() : void {
			if (animate) {
				TweenLite.to(view.wave1, 1, {x:view.wave1.x + state});
				TweenLite.to(view.wave2, 1, {x:view.wave2.x - state});
				TweenLite.to(view.wave3, 1, {x:view.wave3.x + state, onComplete:this.onWavesAnimation});

				state = state * -1;
			}
			animate = true;
		}

		public function offWavesAnimation() : void {
			animate = false;
		}

		public function onDucksAnimation() : void {
			view.ducksView1.onAnimation();
			view.ducksView2.onAnimation();
			view.ducksView3.onAnimation();
		}
		
		public function ducksShooted() : int{
			return view.ducksView1.ducksShooted()+view.ducksView2.ducksShooted()+view.ducksView3.ducksShooted();
			
		}

		public function removeEventListeners() : void {
			view.ducksView1.removeEventListeners();
			view.ducksView2.removeEventListeners();
			view.ducksView3.removeEventListeners();
		}

		public function reloadEventListeners() : void {
			
			view.ducksView1.reloadEventListeners();
			view.ducksView2.reloadEventListeners();
			view.ducksView3.reloadEventListeners();
		}
	}
}
