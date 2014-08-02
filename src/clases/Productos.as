package clases
{
	import flash.events.EventDispatcher;
	
	import mx.events.PropertyChangeEvent;

	public class Productos extends EventDispatcher
	{		
		private var _id_producto:int;	
		private var _id_sucursal:int;
		private var _codigo_barra:String;
		private var _nom_producto:String;
		private var _descripcion:String;	
		private var _cantidad:int;	
		private var _precio:Number;	
		private var _precio_compra:Number;	
		private var _marca:String;	
		private var _img:String;	
		private var _link:String;
		private var _path:String;
		private var _binario:String;	
		private var _fecha_entrada:Date;	
		private var _tipoVenta:String;	
		private var _ofertas_Especiales:String;	
		private var _indice:int;	
		
		[Bindable(event="propertyChange")]
		public function get id_producto():int
		{
			return _id_producto;
		}
		
		public function set id_producto(value:int):void
		{
			var oldValue:int = _id_producto;
			if (oldValue != value){
				_id_producto = value;
				dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get id_sucursal():int
		{
			return _id_sucursal;
		}
		
		public function set id_sucursal(value:int):void
		{
			var oldValue:int = _id_sucursal;
			if (oldValue != value)
				_id_sucursal = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get codigo_barra():String
		{
			return _codigo_barra;
		}
		
		public function set codigo_barra(value:String):void
		{
			var oldValue:String = _codigo_barra;
			if (oldValue != value)
				_codigo_barra = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get descripcion():String
		{
			return _descripcion;
		}
		
		public function set descripcion(value:String):void
		{
			var oldValue:String = _descripcion;
			if (oldValue != value)
				_descripcion = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get cantidad():int
		{
			return _cantidad;
		}
		
		public function set cantidad(value:int):void
		{
			var oldValue:int = _cantidad;
			if (oldValue != value)
				_cantidad = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get marca():String
		{
			return _marca;
		}
		
		public function set marca(value:String):void
		{
			var oldValue:String = _marca;
			if (oldValue != value)
				_marca = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get link():String
		{
			return _link;
		}
		
		public function set link(value:String):void
		{
			var oldValue:String = _link;
			if (oldValue != value)
				_link = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get binario():String
		{
			return _binario;
		}
		
		public function set binario(value:String):void
		{
			var oldValue:String = _binario;
			if (oldValue != value)
				_binario = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get fecha_entrada():Date
		{
			return _fecha_entrada;
		}
		
		public function set fecha_entrada(value:Date):void
		{
			var oldValue:Date = _fecha_entrada;
			if (oldValue != value)
				_fecha_entrada = value;
		}
		
		[Bindable(event="propertyChange")]
		public function get tipoVenta():String
		{
			return _tipoVenta;
		}
		
		public function set tipoVenta(value:String):void
		{
			var oldValue:String = _tipoVenta;
			if (oldValue != value)
				_tipoVenta = value;
		}
		
		[Bindable(event="propertyChange")]
		public function get ofertas_Especiales():String
		{
			return _ofertas_Especiales;
		}
		
		public function set ofertas_Especiales(value:String):void
		{
			var oldValue:String = _ofertas_Especiales;
			if (oldValue != value)
				_ofertas_Especiales = value;
		}
		
		[Bindable(event="propertyChange")]
		public function get indice():int
		{
			return _indice;
		}
		
		public function set indice(value:int):void
		{
			var oldValue:int = _indice;
			if (oldValue != value)
				_indice = value;
		}
		
		
		[Bindable(event="propertyChange")]
		public function get path():String
		{
			return _path;
		}
		
		public function set path(value:String):void
		{
			var oldValue:String = _path;
			if (oldValue != value)
				_path = value;
		}
		
		
		[Bindable]
		public function get img():String {
			return _img;
		}
		
		public function set img(newValue:String):void {
			var oldValue:String = img;
			if (oldValue != newValue){
				_img = newValue;
				dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
			}
		}
				
		[Bindable]
		public function get nom_producto():String {
			return _nom_producto;
		}
		
		public function set nom_producto(newValue:String):void {
			var oldValue:String = _nom_producto;
			if (oldValue != newValue)
				_nom_producto = newValue;
		}
		
		[Bindable]
		public function get precio():Number {
			return _precio;
		}
		
		public function set precio(newValue:Number):void {
			var oldValue:Number = _precio;
			if (oldValue != newValue)
				_precio = newValue;
		}
		
		[Bindable]
		public function get precio_compra():Number {
			return _precio_compra;
		}
		
		public function set precio_compra(newValue:Number):void {
			var oldValue:Number = _precio_compra;
			if (oldValue != newValue)
				_precio_compra = newValue;
		}
	}
}