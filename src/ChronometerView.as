package {
	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * View controlada por ChronometerController.
	 * Passa um TextField para o seu controlador.
	 * O TextField é controlado por ChronometerController.
	 */
	public class ChronometerView extends MovieClip {
		private var cron : ChronometerController;
		public var txtField : TextField;

		public function ChronometerView() {
			cron = new ChronometerController(txtField);
		}

		public function continueTime() : void {
			cron.continueTime();
		}

		public function stopTime() : void {
			cron.stopTime();
		}
	}
}
