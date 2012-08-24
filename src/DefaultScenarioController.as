package {
	import fl.controls.Button;

	import flash.display.MovieClip;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	import flash.utils.getTimer;

	/**
	 * Controlador do DefaultScenarioView.
	 * O método getView é necessário para obter a referência da View.
	 * O método startGame() chama startUpdate() que é o método responsável pelo início das animações.
	 */
	// Iago, preciso revisar esse código com você. Ok?
	public class DefaultScenarioController extends MovieClip {
		
		public var view : DefaultScenarioView;
		private var update : Boolean = true;
		public var acc : Accelerometer = new Accelerometer(); // erro esperado
		
		var lastShake:Number = 0;
		var shakeWait:Number = 500;

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
			
			view.addEventListener(MouseEvent.CLICK, onShoot);
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate); // erro esperado
			
			switch(button.name) {
				case 'pauseButton':
					view.pauseButton.addEventListener(MouseEvent.CLICK, pauseGame);
					break;
			}
		}
		
		function onAccUpdate(e:AccelerometerEvent):void
		{
			if(getTimer() - lastShake > shakeWait && (e.accelerationX >= 1.5 || e.accelerationY >= 1.5 || e.accelerationZ >= 1.5))
			{
				shakeIt();
				lastShake = getTimer();
			}
		}
 
function shakeIt():void
{
		view.ammu.reload();
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
		
		public function onShoot(e:MouseEvent) : void {
			view.ammu.shooted();
		}
	}
}
