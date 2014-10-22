package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import com.shopbeam.*;
	
	public class toryburch extends MovieClip {

		public var playDirection: Number = -1;
		
		public function toryburch() {
			 this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}
		
		public function onAddedToStage(e:Event):void 
		{   
			var shopbeam:Shopbeam = new Shopbeam("e8abf83f-38f2-450b-80e5-32d206ce85e6", this);
			shopbeam.onClickGoToProduct("bootsOverlay", "9184368");
			shopbeam.onClickGoToProduct("bagOverlay", "9184366");
			shopbeam.onClickGoToProduct("blouseOverlay", "9184358");

			prepareAnimation(this.shopbeamLogo);
			prepareAnimation(this.boots);
			prepareAnimation(this.bag);
			prepareAnimation(this.shirt);
			
			var self = this;
			
			this.addEventListener(MouseEvent.MOUSE_OVER, function (e: Event) {
				self.playDirection = 1;
			});

			this.addEventListener(MouseEvent.MOUSE_OUT, function (e: Event) {
				self.playDirection = -1;
			});
			
		}
		
		private function prepareAnimation(mc:MovieClip) {
			var self = this;
			
			mc.addEventListener(Event.ENTER_FRAME, function():void {
				if (self.playDirection > 0) {
					if (mc.totalFrames > mc.currentFrame) {
						mc.nextFrame();
					}
				} else if (self.playDirection < 0) {
					if (mc.currentFrame > 1) {
						mc.prevFrame();
					}
				}
			});
		}		
	
	}
}
