package {
	import flash.display.MovieClip;
	import com.shopbeam.*;
	
	public class shopbeamtestad extends MovieClip {
		public function shopbeamtestad() {

			var shopbeam:Shopbeam = new Shopbeam("e8abf83f-38f2-450b-80e5-32d206ce85e6", this);
			shopbeam.onClickGoToProduct("product1", "9184551");
		}
	}
}
