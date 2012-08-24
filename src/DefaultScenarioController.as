package {
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
	public class DefaultScenarioController extends Object {
		
		public var view : DefaultScenarioView;
		private var update : Boolean = true;
		public var acc : Accelerometer = new Accelerometer();
	
		
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
			
			update = true;
			onWavesAnimation(); // ativa a animação das ondas 
			view.addEventListener(Event.ENTER_FRAME, updateWorld); //ativa a animação da camada dos patos
		}

		private function stopUpdate() : void { // desativa a animação da camada dos patos
			update = false;
		}

		private function updateWorld(event : Event) : void { // executa as animações da camada dos patos
			
			if (update) { 
				onDucksAnimation();
			}
		}

		public function setEventListeners(button : MovieClip) : void {
 			
 			view.pauseMenuView.pauseMenuController.addEventListener("onPlayButton", unPauseGame); // ver  com o thiago
			view.pauseMenuView.pauseMenuController.addEventListener("onExitButton", onMainMenu);
			view.addEventListener(MouseEvent.CLICK, onShoot); // listener dos eventos de click no stage
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);  // listener do acelerometro
			
			switch(button.name) {
				case 'pauseButton':
					view.pauseButton.addEventListener(MouseEvent.CLICK, pauseGame);
					break;
			}
		}
	
		
		function onAccUpdate(e:AccelerometerEvent):void // listener do acelerometro
		{
			// gera o shake
			if(getTimer() - lastShake > shakeWait && (e.accelerationX >= 1.5 || e.accelerationY >= 1.5 || e.accelerationZ >= 1.5))
			{
				onReload(); // chama o metodo de recarregar 
				lastShake = getTimer();
			}
		}


		private function pauseGame(event : MouseEvent) : void { // pausa todas as animações do jogo
			acc.removeEventListener(AccelerometerEvent.UPDATE, onAccUpdate); // remove o listener do accelerometro
			view.removeEventListener(MouseEvent.CLICK, onShoot); // remove o listener do evento de click no stage
			if(view.pauseMenuView.visible == false) view.pauseMenuView.visible = true;
			view.addChild(view.pauseMenuView); // adciona o pause menu 
			offWavesAnimation(); // pausa a animação das ondas
			stopUpdate(); // pausa a animação da camada patos
			stopTime(); // pausa o timer
		}
		
		private function unPauseGame(e:Event) : void{
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);
			view.pauseMenuView.visible = false;
			view.addEventListener(MouseEvent.CLICK, onShoot); // habilita o evento de click no stage
			onWavesAnimation();
			startGame(); 
			continueTime();
			trace("startGame");
		}

	

		private function onMainMenu(e:Event) : void {
			trace("on Main Menu");
		}
		private function continueTime() : void {
			view.crn.continueTime();
		}
		
		private function stopTime() : void {
			view.crn.stopTime(); // pausa o contador
		}

		private function onWavesAnimation() : void {
			view.wavesView.onWavesAnimation(); // ativa animação das ondas
		}

		private function offWavesAnimation() : void {
			view.wavesView.offWavesAnimation(); // desativa animação das ondas
		}

		private function onDucksAnimation() : void {
			view.wavesView.onDucksAnimation(); // ativa animação da camada dos patos
		}
		
		public function onShoot(e:MouseEvent) : void { 
			view.ammu.shooted(); // diminui a quantidade de balas
		}
		
		function onReload():void {
			view.ammu.reload(); // aumenta a quantidade de balas
		}
	}
}
