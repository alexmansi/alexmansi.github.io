package {
    import flash.display.MovieClip;
    import com.shopbeam.*;
	import flash.events.*;


	public class Shoptiques_leaderboard extends MovieClip {
		public var playDirection: Array = [false, false, false];		
		
		public function Shoptiques_leaderboard() { 

			var shopbeam:Shopbeam = new Shopbeam("cec31e4c-cf11-49f6-8b1c-3fb3618ea2f4", this);

			// first argument is a MovieClip name, the second argument is a product ID
			shopbeam.onClickGoToProduct("heel", "9184456");
			  
			// optional additional call to wire up another MovieClip
			shopbeam.onClickGoToProduct("bag", "9184770");
			
			setupAnimation(this.shopbeam_bag, 0);
			setupAnimation(this.heel, 1);
			setupAnimation(this.bag, 2);
			
			var self = this;
			
			setupHover(this, 0);
			setupHover(this.heel, 1);
			setupHover(this.bag, 2);
		} 
		
		private function setupHover(mc:MovieClip, i:Number) {
			var self = this;
			
			mc.addEventListener(MouseEvent.MOUSE_OVER, function (e: Event) {
				self.playDirection[i] = true;
			});

			mc.addEventListener(MouseEvent.MOUSE_OUT, function (e: Event) {
				self.playDirection[i] = false;
			});
		}
		
		private function setupAnimation(mc:MovieClip, i:Number) {
			var self = this;
			
			mc.addEventListener(Event.ENTER_FRAME, function():void {
				if (self.playDirection[i]) {
					if (mc.totalFrames > mc.currentFrame) {
						mc.nextFrame();
					}
				} else {
					if (mc.currentFrame > 1) {
						mc.prevFrame();
					}
				}
			});
		}

	}
}
