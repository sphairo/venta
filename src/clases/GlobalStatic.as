package clases
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class GlobalStatic extends EventDispatcher
	{
		private static const _DataBaseName:String = "venta";
		private static const _DataBaseName2:String = "informix_desarrollo2";
		
		private static const _sIpServidor:String = "localhost";
		/*private static const _sIpServidor:String = "201.116.66.148";*///IP publica
		
		/**propiedesDatosUsuario:[0].agr_foto, [1].usr_clave, [2].usr_nombre, [3].usr_expediente*/
		private static var _DatosUsuario:ArrayCollection = new ArrayCollection();
		/*public static var wsdl:String = "http://localhost/STRMserviciosweb/SQLconsultas/ConsultaSQL.asmx?wsdl";*/// IP LOCAL
		/*public static var wsdl:String = "http://192.168.0.73/STRMserviciosweb/SQLconsultas/ConsultaSQL.asmx?wsdl";*/// IP PRIVADA STRM
		/*public static var wsdl:String = "http://201.116.66.148/STRMserviciosweb/SQLconsultas/ConsultaSQL.asmx?wsdl";*/// IP EXTERNA STRM
		private static const _puerto:String = "8080";
		/**PrivilegiosUsuario: return id_modulo, id_aplicaciones, Priv_Total, id_user, usuario, password, nombre_modulo, nombre_aplicaciones, nombre_archivo_fisico, contenedor*/
		public static const url_image:String = "http://127.0.0.1/Ventas/amfphp/services/files/";
		private static var _PrivilegiosUsuario:ArrayCollection = new ArrayCollection();
		private static var _aplicacion:Object = new Object();
		private static var _defaultDateRange:Object = new Object();
		private static var _ServidorFechaHora:Date = new Date();
		private static var _opcion:uint;
		
		[Bindable] public static var utility:Utileria = new Utileria();

		/** Alerta modificasiones sin Guardar */
		private static var _AlertaDatosSinGuardar:Object = null;
		/**
		 * @public
		 */
		public function GlobalStatic(){}
		
		public static function set aplicacion(value:Object):void
		{
			var oldValue:Object = _aplicacion;
			if (oldValue !== value)
				_aplicacion = value;
		}
		
		public static function set DatosUsuario(value:ArrayCollection):void 
		{ 
			var oldValue:ArrayCollection = _DatosUsuario;
			if (oldValue !== value)
				_DatosUsuario = value;
		}
		
		public static function set PrivilegiosUsuario(value:ArrayCollection):void 
		{
			var oldValue:ArrayCollection = _PrivilegiosUsuario;
			if (oldValue !== value)
				_PrivilegiosUsuario = value;
		}
		
		public static function set AlertaDatosSinGuardar(value:Object):void
		{
			var oldValue:Object = _AlertaDatosSinGuardar;
			if (oldValue !== value)
				_AlertaDatosSinGuardar = value;
		}
		
		public static function set ServidorFechaHora(value:Date):void
		{
			var oldValue:Date = _ServidorFechaHora;
			if (oldValue !== value)
			{
				_ServidorFechaHora = value;
				DefaultDateRange = {rangeStart : new Date(1970,0,1), rangeEnd : ServidorFechaHora};
			}
		}
		
		public static function set DefaultDateRange(value:Object):void
		{
			var oldValue:Object = _defaultDateRange;
			if (oldValue !== value)
				_defaultDateRange = value;
		}
		
		public static function set opcion(value:uint):void
		{
			if (value != opcion)
				_opcion = value;
		}
		
		public static function get opcion():uint 
		{
			return _opcion;
		}
		
		/**Getters*/
		
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
		
		/**Esta propiedad regresa el nombre de la base de datos del STRM (Contiene las tablas de privilegios, modulos y aplicaciones)*/
		public static function get DataBaseName2():String
		{
			return _DataBaseName2;
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