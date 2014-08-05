package clases
{
	import flash.display.Loader;
	import flash.errors.IllegalOperationError;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	public class Cleanner
	{
		//-----------------------
		// Variables
		//-----------------------
		/**
		 * Memoria para ejecutarse el GC
		 */
		static public var warningMemory:int = 1000*1000*500;
		/**
		 * Memoria para el crash
		 */
		static public var abortMemory:int = 1000*1000*625;
		/**
		 * Funcion q se ejecuta al hacer crashh (sin memoria)
		 */
		static public var funcCrash:Function;
		/**
		 * Cada cuanto tiempo se verifica el uso de la memoria 
		 * cuando se esta haciendo el trakeo
		 */
		static public var timeToCheckMemory:int = 10000;
		static private var id:int; 
		//-----------------------
		// Constructor
		//-----------------------
		public function Cleanner()
		{
			throw new IllegalOperationError("ClearLoaders is static. It don't create intances"); 
		}
		
		//-----------------------
		// Public Methods
		//-----------------------
		/**
		 * 
		 * Elimino algo que haya cargado por Loader.
		 * No siempre combiene pasar el GC luego de 
		 * eliminar un modulo o swf cargado porque caería
		 * la eficiencia general de la aplicación.
		 * 
		 * @param loader       Referencia a un Loader
		 * @param gc         Indica si al descargar debe correrse el Garbage Collector
		 * 
		 */
		static public function unload(loader:Loader, gc:Boolean = false):void
		{
			try
			{ // para FP 10 o superior
				loader.unloadAndStop()
			}
			catch (e:Error)
			{
				loader.unload();
			}
			
			if ( gc )
				Cleanner.gc();
		}
		
		/**
		 * 
		 * Ejecuto el Garbage Collector del Flash Player
		 * para que libere la memoria
		 * 
		 */
		static public function gc():void
		{
			try
			{ // para FP10 o superior
				System.gc();
			}
			catch(e:*)
			{
				try { // versiones anteriores
					new LocalConnection().connect('foo');
					new LocalConnection().connect('foo');
				} 
				catch (e:*) 
				{
				}
			}
		}
		
		/**
		 * 
		 * Trackea el uso de la memoria y la va liberando
		 * de forma automatica
		 * 
		 */
		static public function startGCController():void
		{
			Cleanner.checkMemoryUsage();
			Cleanner.id = setInterval(checkMemoryUsage, Cleanner.timeToCheckMemory);
		}
		
		/**
		 * 
		 * Termino el trackeo de la memoria
		 * 
		 */
		static public function endGCController():void
		{
			clearInterval(Cleanner.id);
			Cleanner.id = undefined;
		}
		
		//-----------------------
		// Private Methods
		//-----------------------
		static private function checkMemoryUsage():void {
			if (System.totalMemory > Cleanner.warningMemory) {
				Cleanner.gc();
			} else if (System.totalMemory > Cleanner.abortMemory) {
				//crashhhhh 
				if ( Cleanner.funcCrash != null )
					Cleanner.funcCrash();
			}
		}
	}
}