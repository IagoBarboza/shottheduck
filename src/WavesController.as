package {
	import com.greensock.TweenLite;
	/**
	 * @author Ibs
	 */
	public class WavesController extends Object {
		
		public var view : WavesView;
		public var animate : Boolean = true;
		private var state : int = 100;
		
		
		public function WavesController() {
		}
		
		public function getView(view : WavesView ):void{
			this.view = view;
		}
		
		public function onWavesAnimation():void{
			
			if(animate)
			{
				TweenLite.to(view.wave1, 1, {x:view.wave1.x + state});
				TweenLite.to(view.wave2, 1, {x:view.wave2.x - state});
				TweenLite.to(view.wave3, 1, {x:view.wave3.x + state, onComplete:this.onWavesAnimation});
			
				state = state*-1;
			}
				animate = true;
		}
		
		public function offWavesAnimation():void{
			if(animate == true) animate = false;
			else{
				 animate = true;
				 this.onWavesAnimation();
			}
		}
		
		public function onDucksAnimation():void{
			view.ducksView1.onAnimation();
			view.ducksView2.onAnimation();
			view.ducksView3.onAnimation();
		}		
		
	}
}
