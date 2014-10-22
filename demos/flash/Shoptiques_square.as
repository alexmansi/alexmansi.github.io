package {
    import flash.display.MovieClip;
    import com.shopbeam.*;
	import flash.events.*;
	
	public class Shoptiques_square extends MovieClip {
		public var playDirection: Array = [false, false, false, false];		
		
		public function Shoptiques_square() { 

			var shopbeam:Shopbeam = new Shopbeam("d1a70cb5-db3d-49d5-bb1c-e78c65ccc258", this);

			// first argument is a MovieClip name, the second argument is a product ID
			shopbeam.onClickGoToProduct("heel", "9184456");

			// optional additional call to wire up another MovieClip
			shopbeam.onClickGoToProduct("dress", "9184468");
			  
			// optional additional call to wire up another MovieClip
			shopbeam.onClickGoToProduct("bag", "9184770");
		
			setupAnimation(this.shopbeam_bag, 0);
			setupAnimation(this.heel, 1);
			setupAnimation(this.dress, 2);
			setupAnimation(this.bag, 3);
			
			
			setupHover(this, 0);
			setupHover(this.heel, 1);
			setupHover(this.dress, 2);
			setupHover(this.bag, 3);

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