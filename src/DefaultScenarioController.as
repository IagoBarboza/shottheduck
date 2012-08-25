package {
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.AccelerometerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sensors.Accelerometer;
	import flash.utils.getTimer;
	/**
	 * @author Ibs
	 */
	public class DefaultScenarioController extends Object {
		
		public var view : DefaultScenarioView;
		public var acc : Accelerometer = new Accelerometer();
		var lastShake : Number = 0;
		var shakeWait : Number = 500;
		
		public function DefaultScenarioController(view : DefaultScenarioView) {
			this.view = view;
		}

		public function setEventListener(mc : MovieClip) : void {
			
			// listeners dos eventos do pause menu
			view.pauseMenuView.addEventListener("onPlayButton",unPauseGame);
			view.pauseMenuView.addEventListener("onExitButton", onMainMenu);

			// listener dos eventos de click no stage
			view.addEventListener(MouseEvent.CLICK, onShoot);

			// listener do acelerometro(reload)
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);

			switch(mc.name) {
				case 'pauseButton':
					view.pauseButton.addEventListener(MouseEvent.CLICK, pauseGame);
					break;
			}
		}

		public function startGame() : void {
			startUpdate();
		}

		private function startUpdate() : void {
			// ativa a animação das ondas
			onWavesAnimation();
			// ativa a animação da camada dos patos
			view.addEventListener(Event.ENTER_FRAME, onDucksAnimation);
		}
		
		function onAccUpdate(e : AccelerometerEvent) : void // listener do acelerometro
 		{
			// analisa se houve shake
			if (getTimer() - lastShake > shakeWait && (e.accelerationX >= 1.5 || e.accelerationY >= 1.5 || e.accelerationZ >= 1.5)) {
				// chama o metodo de recarregar
				onReload();
				lastShake = getTimer();
			}
		}

		private function pauseGame(event : MouseEvent) : void {
			// esconde o pause button
			view.pauseButton.visible = false;

			// desativa a animação dos patos
			view.removeEventListener(Event.ENTER_FRAME, onDucksAnimation);

			// remove o listener do accelerometro(desabilita o reload)
			acc.removeEventListener(AccelerometerEvent.UPDATE, onAccUpdate);

			// remove o listener do evento de click no stage
			view.removeEventListener(MouseEvent.CLICK, onShoot);

			// analisa se o pause menu já n levou um visible false
			if (view.pauseMenuView.visible == false) view.pauseMenuView.visible = true;
			
			// adciona o pause menu
			view.addChild(view.pauseMenuView);

			// desativa a animação das ondas
			offWavesAnimation();

			// pausa o timer
			stopTime();
		}

		private function unPauseGame(e : Event) : void {
			// mostra o pause button
			view.pauseButton.visible = true;

			// adciona o listener do accelerometro
			acc.addEventListener(AccelerometerEvent.UPDATE, onAccUpdate);

			// remove o pauseMenu do stage
			view.pauseMenuView.visible = false;

			// habilita o evento de click no stage
			view.addEventListener(MouseEvent.CLICK, onShoot);

			// starta a animação das ondas
			onWavesAnimation();

			// ativa a animação dos patos
			view.addEventListener(Event.ENTER_FRAME, onDucksAnimation);

			// continua o timer
			continueTime();
		}

		private function onMainMenu(e : Event) : void {
			view.dispatchEvent(new Event("onMainMenu"));
			view.visible = false;
		}

		private function continueTime() : void {
			// continua o contador
			view.crn.continueTime();
		}

		private function stopTime() : void {
			// pausa o contador
			view.crn.stopTime();
		}

		private function onWavesAnimation() : void {
			// ativa animação das ondas
			view.wavesView.onWavesAnimation();
		}

		private function offWavesAnimation() : void {
			// desativa animação das ondas
			view.wavesView.offWavesAnimation();
		}

		private function onDucksAnimation(event : Event) : void {
			// ativa animação da camada dos patos
			view.wavesView.onDucksAnimation();
			//trace(view.ammu.getCurrentAmmu());
//			if(view.ammu.getCurrentAmmu()==0){
//				 view.removeEventListener(MouseEvent.CLICK, onShoot);
//				view.wavesView.removeEventListener(MouseEvent.CLICK, onShoot);
//			}
//			if(view.ammu.getCurrentAmmu()>=0){
//				 view.addEventListener(MouseEvent.CLICK, onShoot);
//				 view.addEventListener(MouseEvent.CLICK, onShoot);
//			}
		}

		public function onShoot(e : MouseEvent) : void {
			// diminui a quantidade de balas
			try{
				view.ammuView.shooted();
				trace(view.ammuView.getCurrentAmmu());
				updateScore();
			}catch(e : NoAmmunition)
			{
				trace("no ammu");
				view.removeEventListener(MouseEvent.CLICK, onShoot);
				view.wavesView.removeEventListeners();
			}
			
		}

		private function updateScore() : void {
			var text : String;
			text = String(view.wavesView.ducksShooted());
			view.scoreView.setText(text);
		}

		function onReload() : void {
			view.addEventListener(MouseEvent.CLICK, onShoot);
			view.wavesView.reloadEventListeners();
			view.ammuView.reload();
		}

		public function showFinalScoreView() : void {
			view.addChild(view.finalScoreView);
			TweenLite.to(view.finalScoreView, 2, {y:-25});
		}
		
		public function hideFinalScoreView() : void {
			TweenLite.to(view.finalScoreView, 2, {y:-575});
		}
	}
}
