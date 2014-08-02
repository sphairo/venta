package components.skins {

	import mx.core.DPIClassification;

	import spark.skins.mobile.CalloutSkin;

	/**
	 * SparkCalloutSkin extends CalloutSkin providing abilities
	 * to customize it by exposing protected properties.
	 *
	 * @author riatiger
	 *
	 */
	public class SparkCalloutSkin extends CalloutSkin {

		public function SparkCalloutSkin() {
			super();
			initSkin();
		}
		
		protected function initSkin():void{
			// this skin does not implement contentBackgroundAppearance=inset
			contentBackgroundInsetClass = null;
			
			// backgroundColor frame is not visible
			frameThickness = 0;
			
			// disable backgroundColor gradient fill
			useBackgroundGradient = false;
			
			// make the arrow width and height smaller than the default
			switch (applicationDPI) {
				case DPIClassification.DPI_320:  {
					arrowWidth = 60;
					arrowHeight = 30;
					break;
				}
				case DPIClassification.DPI_240:  {
					arrowWidth = 45;
					arrowHeight = 15;
					break;
				}
				default:  {
					arrowWidth = 27;
					arrowHeight = 9;
					break;
				}
			}
		}

		override protected function createChildren():void {

			// create arrow first, super will skip default arrow creation 
			arrow = new SimpleCalloutArrow();
			arrow.id = "arrow";
			arrow.styleName = this;

			// call super
			super.createChildren();

			// add arrow above all other children
			addChild(arrow);

			// bring contentGroup to front
			swapChildren(arrow, contentGroup);
		}

		protected function get calloutArrow():SimpleCalloutArrow {
			return arrow as SimpleCalloutArrow;
		}

		public function get calloutBorderColor():Number {
			return super.borderColor;
		}

		public function set calloutBorderColor(value:Number):void {
			if (calloutArrow) {
				calloutArrow.arrowBorderColor = value;
			}
			super.borderColor = value;
		}

		public function get calloutBorderThickness():Number {
			return super.borderThickness;
		}

		public function set calloutBorderThickness(value:Number):void {
			if (calloutArrow) {
				calloutArrow.arrowBorderThickness = value;
			}
			super.borderThickness = value;
		}
	}
}
