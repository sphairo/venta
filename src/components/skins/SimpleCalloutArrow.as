package components.skins {

	import spark.skins.mobile.supportClasses.CalloutArrow;

	public class SimpleCalloutArrow extends CalloutArrow {

		public function SimpleCalloutArrow() {
			super();

			// disable backgroundColor gradient fill
			useBackgroundGradient = false;
		}

		public function get arrowBorderColor():Number {
			return super.borderColor;
		}

		public function set arrowBorderColor(value:Number):void {
			super.borderColor = value;
		}

		public function get arrowBorderThickness():Number {
			return super.borderThickness;
		}

		public function set arrowBorderThickness(value:Number):void {
			super.borderThickness = value;
		}
	}
}
