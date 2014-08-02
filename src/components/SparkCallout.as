package components {

	import components.skins.SparkCalloutSkin;
	
	import spark.components.Callout;

	[Style(name="borderColor", type="uint", format="Color", inherit="no", theme="spark, mobile")]
	[Style(name="borderThickness", type="uint", format="Number", inherit="no", theme="spark, mobile")]
	
	public class SparkCallout extends Callout {
		public function SparkCallout() {
			super();
			setStyle("skinClass", SparkCalloutSkin);
		}


		public function get sparkSkin():SparkCalloutSkin {
			return skin as SparkCalloutSkin;
		}

		//magic happens here
		override protected function attachSkin():void {
			super.attachSkin();

			sparkSkin.calloutBorderColor = getStyle("borderColor");
			sparkSkin.calloutBorderThickness = getStyle("borderThickness");
		}
	}
}
