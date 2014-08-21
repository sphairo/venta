package clases
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.utils.ByteArray;
	import org.as3wavsound.WavSound;
	import org.as3wavsound.WavSoundChannel;

	public class Sounds extends Sprite
	{		
		[Embed(source = "camara.wav", mimeType = "application/octet-stream")]
		public const DrumLoop:Class;
		/*public const RainLoop:Class;
		public const rain:WavSound = new WavSound(new RainLoop() as ByteArray);*/
		
		public function Sounds()
		{
			var drumLoop:WavSound = new WavSound(new DrumLoop() as ByteArray);
			drumLoop.play(0, 44100);
		}
	}
}