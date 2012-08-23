package {
	import fl.controls.Button;

	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * Controlador do DefaultScenarioView.
	 * O método getView é necessário para obter a referência da View.
	 * O método startGame() chama startUpdate() que é o método responsável pelo início das animações.
	 */
	// Iago, preciso revisar esse código com você. Ok?
	public class DefaultScenarioController extends Object {
		public var view : DefaultScenarioView;
		private var update : Boolean = true;

		public function DefaultScenarioController() {
		}

		public function getView(view : DefaultScenarioView) : void {
			this.view = view;
		}

		public function startGame() : void {
			startUpdate();
		}

		private function startUpdate() : void {
			onWavesAnimation();
			view.addEventListener(Event.ENTER_FRAME, updateWorld);
			update = true;
		}

		private function stopUpdate() : void {
			update = false;
		}

		private function updateWorld(event : Event) : void {
			if (update) {
				onDucksAnimation();
			}
		}

		public function setEventListeners(button : Button) : void {
			switch(button.name) {
				case 'pauseButton':
					view.pauseButton.addEventListener(MouseEvent.CLICK, pauseGame);
					break;
			}
		}

		private function pauseGame(event : MouseEvent) : void {
			offWavesAnimation();
			stopUpdate();
			stopTime();
		}

		private function stopTime() : void {
			view.crn.stopTime();
		}

		private function onWavesAnimation() : void {
			view.wavesView.onWavesAnimation();
		}

		private function offWavesAnimation() : void {
			view.wavesView.offWavesAnimation();
		}

		private function onDucksAnimation() : void {
			view.wavesView.onDucksAnimation();
		}
	}
}
