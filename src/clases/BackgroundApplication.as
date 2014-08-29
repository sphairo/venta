package clases
{
	import mx.graphics.BitmapFill;
	import mx.graphics.BitmapFillMode;
	
	import spark.skins.spark.ApplicationSkin;
	
	public class BackgroundApplication extends ApplicationSkin{
		[Bindable][Embed("img/patterntop.png", mimeType="image/png")] internal const fondo:Class;
		public function BackgroundApplication(){
			super();
			var rellenoBitmap:BitmapFill = new BitmapFill();
			rellenoBitmap.source = fondo;
			rellenoBitmap.fillMode = BitmapFillMode.REPEAT;
			backgroundRect.fill = rellenoBitmap;
		}
	}
}