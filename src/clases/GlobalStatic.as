package clases
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class GlobalStatic extends EventDispatcher
	{
		private static const _DataBaseName:String = "venta";
		
		private static const _sIpServidor:String = "localhost";
		private static var _DatosUsuario:ArrayCollection = new ArrayCollection();
		private static const _puerto:String = "8080";		
		private static var _PrivilegiosUsuario:ArrayCollection = new ArrayCollection();
		private static var _aplicacion:Object = new Object();
		private static var _defaultDateRange:Object = new Object();
		private static var _ServidorFechaHora:Date = new Date();
		public static var _arrayCarrito:ArrayCollection = new ArrayCollection();
		private static var _newProducto:Object;
		
		
		[Bindable] public static var utility:Utileria = new Utileria();

		/** Alerta modificasiones sin Guardar */
		private static var _AlertaDatosSinGuardar:Object = null;
		/**
		 * @public
		 */
		public function GlobalStatic(){}
		
		public static function set aplicacion(value:Object):void
		{
			if (value != aplicacion)
				_aplicacion = value;
		}
		
		public static function set DatosUsuario(value:ArrayCollection):void 
		{ 
			if (value != DatosUsuario)
				_DatosUsuario = value;
		}
		
		public static function set PrivilegiosUsuario(value:ArrayCollection):void 
		{
			if (value != PrivilegiosUsuario)
				_PrivilegiosUsuario = value;
		}
		
		public static function set AlertaDatosSinGuardar(value:Object):void
		{
			//var oldValue:Object = _AlertaDatosSinGuardar;
			if (value != AlertaDatosSinGuardar)
				_AlertaDatosSinGuardar = value;
		}
		
		public static function set ServidorFechaHora(value:Date):void
		{
			if (value != ServidorFechaHora)
			{
				_ServidorFechaHora = value;
				DefaultDateRange = {rangeStart : new Date(1970,0,1), rangeEnd : ServidorFechaHora};
			}
		}
		
		public static function set DefaultDateRange(value:Object):void
		{
			if (value != DefaultDateRange)
				_defaultDateRange = value;
		}
		
		public static function set newProducto(value:Object):void{
				_newProducto = value;
				//_arrayCarrito.addItem(value);
		}
		/**Getters*/
		
		public static function get newProducto():Object {
			return _newProducto;
		}
		
		public static function get arrayCarrito():ArrayCollection {
			return _arrayCarrito;
		}
		
		public static function get sIpServidor():String 
		{
			return _sIpServidor;
		}
		
		public static function get puerto():String 
		{
			return _puerto;
		}
		
		[Bindable(event="propertyChange")]
		public static function get aplicacion():Object
		{
			return _aplicacion;
		}
		
		[Bindable(event="propertyChange")]
		public static function get DatosUsuario():ArrayCollection 
		{
			return _DatosUsuario;
		}
		
		[Bindable(event="propertyChange")]
		public static function get PrivilegiosUsuario():ArrayCollection 
		{
			return _PrivilegiosUsuario;
		}
		
		/**Esta propiedad regresa el nombre de la base de datos del STRM (Contiene las tablas de producciòn)*/
		public static function get DataBaseName():String
		{
			return _DataBaseName;
		}
				
		public static function get AlertaDatosSinGuardar():Object
		{
			return _AlertaDatosSinGuardar;
		}
		
		/**Esta propiedad regresa un Date con la Fecha y Hora del Servidor. */
		[Bindable(event="propertyChange")]
		public static function get ServidorFechaHora():Date
		{
			return _ServidorFechaHora;	
		}
		
		/**Esta propiedad regresa un String con el mensaje ¿ Desea salir sin guardar los cambios ? */
		[Bindable(event="propertyChange")]
		public static function get SalirMenuPrincipal():String
		{
			return "¿ Desea salir sin guardar los cambios ? ";	
		}
		
		/**Esta propiedad regresa un Object con la Fecha del 1 de Enero de 1970 (Por default) y la Fecha y Hora del Servidor (rangeStart:1970/01/01, rangeEnd:NOW()). */
		[Bindable(event="propertyChange")]
		public static function get DefaultDateRange():Object
		{
			return _defaultDateRange;
		}
	}
}