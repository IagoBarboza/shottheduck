package {
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;

	/**
	 * Controlador de ChronometerView
	 * O construtor recebe um TextField como parâmetro e atualiza-o a cada 1 segundo para o tempo no formato MM:SS.
	 * Logo que o objeto é construído, inicia-se a contagem.
	 * O método showTime atualiza o TextField.
	 * O método stringTime converte o tempo em ms para o formato MM:SS.
	 * O método stopTime pára o cronômetro.
	 * O método continueTime continua a contagem do ponto onde o cronômetro parou. 
	 */
	public class ChronometerController extends Object {
		private var timer : Timer;
		private const COUNT : Number = 120;
		// COUNT: 2 minutos
		private const DELAY : Number = 1000;
		// DELAY:  1 seg.
		public var txtField : TextField;

		public function ChronometerController(txtField : TextField) : void {
			this.txtField = txtField;
			timer = new Timer(DELAY, COUNT);
			timer.addEventListener(TimerEvent.TIMER, showTime);
			timer.start();
		}

		public function showTime(e : TimerEvent) : void {
			txtField.text = stringTime((COUNT) - timer.currentCount);
		}

		private function stringTime(time : Number) : String {
			var seconds : int = time % 60;
			var minutes : int = time / 60;

			var sec : String = String(seconds);
			var min : String = String(minutes);

			if (seconds <= 9)
				sec = "0" + sec;

			if (minutes <= 9)
				min = "0" + min;

			return min + ":" + sec;
		}

		public function stopTime() : void {
			timer.stop();
		}

		public function continueTime() : void {
			timer.start();
		}
	}
}
