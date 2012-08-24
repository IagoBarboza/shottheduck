package {
	import flash.display.MovieClip;

	/**
	 * View que será controlada por DucksController.
	 */
	public class DucksView extends MovieClip {
		public var duck1 : MovieClip;
		public var duck2 : MovieClip;
		public var duck3 : MovieClip;
		public var duck4 : MovieClip;
		public var duck5 : MovieClip;
		public var duck6 : MovieClip;
		public var duck7 : MovieClip;
		public var duck8 : MovieClip;
		public var ducksArray : Array = new Array(MovieClip);
		private var ducksController : DucksController;

		public function DucksView() {
			loadDucksArray();

			ducksController = new DucksController(this);

			setEventListeners(duck1);
			setEventListeners(duck2);
			setEventListeners(duck3);
			setEventListeners(duck4);
			setEventListeners(duck5);
			setEventListeners(duck6);
			setEventListeners(duck7);
			setEventListeners(duck8);
		}

		private function loadDucksArray() : void {
			ducksArray[0] = duck1;
			ducksArray[1] = duck2;
			ducksArray[2] = duck3;
			ducksArray[3] = duck4;
			ducksArray[4] = duck5;
			ducksArray[5] = duck6;
			ducksArray[6] = duck7;
			ducksArray[7] = duck8;
		}

		public function onAnimation() : void {
			ducksController.onUpdate();
			ducksController.onAnimation();
		}

		public function setEventListeners(duck : MovieClip) : void {
			// adciona os event listeners de MouseClick dos patos
			ducksController.setEventListeners(duck);
		}
		
		public function ducksShooted () : int{
			return ducksController.ducksShooted();
		}
	}
}
