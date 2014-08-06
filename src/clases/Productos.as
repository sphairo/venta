package clases
{
	import flash.events.EventDispatcher;
	import flash.system.System;
	
	import mx.events.PropertyChangeEvent;

	public class Productos extends EventDispatcher
	{		
		private var _id_producto:int;	
		private var _id_sucursal:int;
		private var _codigo_barra:String;
		private var _nom_producto:String;
		private var _descripcion:String;	
		private var _cantidad:int = Utileria.defaultValue;	
		private var _precio:Number = Utileria.defaultValue;	
		private var _precio_compra:Number = Utileria.defaultValue;
		private var _marca:String;	
		private var _path:String;	
		private var _fecha_entrada:Date = Utileria.DateToday();	
		private var _tipoVenta:String = "P";
		private var _ofertas_Especiales:String = "N";
		private var _indice:int;	
		private var _isNew:Boolean = false;
		private var _error:Boolean = false;
		
		public function Productos(producto:Object = null){
			if(producto != null){
				id_producto = producto.id_producto;
				id_sucursal = producto.id_sucursal;
				codigo_barra = producto.codigo_barra;
				nom_producto = producto.nom_producto;
				descripcion = producto.descripcion;
				cantidad = producto.cantidad;	
				precio = producto.precio;
				precio_compra = Number(producto.precio_compra);	
				marca = producto.marca;
				path = producto.path;
				fecha_entrada = Utileria.format(producto.fecha_entrada);
				tipoVenta = producto.tipoVenta;	
				ofertas_Especiales =  producto.ofertas_Especiales;	
				indice = producto.indice;
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get id_producto():int
		{
			return _id_producto;
		}
		
		public function set id_producto(newValue:int):void
		{
			if (newValue != id_producto)
			{
				_id_producto = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get id_sucursal():int
		{
			return _id_sucursal;
		}
		
		public function set id_sucursal(newValue:int):void
		{
			if (newValue != id_sucursal)
			{
				_id_sucursal = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		
		[Bindable(event="propertyChange")]
		public function get codigo_barra():String
		{
			return _codigo_barra;
		}
		
		public function set codigo_barra(newValue:String):void
		{
			if (newValue != codigo_barra)
			{
				_codigo_barra = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		
		[Bindable(event="propertyChange")]
		public function get descripcion():String
		{
			return _descripcion;
		}
		
		public function set descripcion(newValue:String):void
		{
			if (newValue != descripcion)
			{
				_descripcion = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		
		[Bindable(event="propertyChange")]
		public function get cantidad():int
		{
			return _cantidad;
		}
		
		public function set cantidad(newValue:int):void
		{
			if (newValue != cantidad)
			{
				_cantidad = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		
		[Bindable(event="propertyChange")]
		public function get marca():String
		{
			return _marca;
		}
		
		public function set marca(newValue:String):void
		{
			if (newValue != marca)
			{
				_marca = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}		
		
		[Bindable(event="propertyChange")]
		public function get fecha_entrada():Date
		{
			return _fecha_entrada;
		}
		
		public function set fecha_entrada(newValue:Date):void
		{
			if (newValue != fecha_entrada)
			{
				_fecha_entrada = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get tipoVenta():String
		{
			return _tipoVenta;
		}
		
		public function set tipoVenta(newValue:String):void
		{
			if (newValue != tipoVenta)
			{
				_tipoVenta = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get ofertas_Especiales():String
		{
			return _ofertas_Especiales;
		}
		
		public function set ofertas_Especiales(newValue:String):void
		{
			if (newValue != ofertas_Especiales)
			{
				_ofertas_Especiales = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get indice():int
		{
			return _indice;
		}
		
		public function set indice(newValue:int):void
		{
			if (newValue != indice)
			{
				_indice = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		
		[Bindable(event="propertyChange")]
		public function get path():String
		{
			return _path;
		}
		
		public function set path(newValue:String):void
		{
			if (newValue != path)
			{
				_path = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
				
		[Bindable(event="propertyChange")]
		public function get nom_producto():String {
			return _nom_producto;
		}
		
		public function set nom_producto(newValue:String):void {
			if (newValue != nom_producto)
			{
				_nom_producto = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get precio():Number {
			return _precio;
		}
		
		public function set precio(newValue:Number):void {
			if (newValue != precio)
			{
				_precio = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get precio_compra():Number {
			return _precio_compra;
		}
		
		public function set precio_compra(newValue:Number):void {
			if (newValue != precio_compra)
			{
				_precio_compra = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get isNew():Boolean {
			return _isNew;
		}
		
		public function set isNew(newValue:Boolean):void {
			if (newValue != isNew)
			{
				_isNew = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get error():Boolean {
			return _error;
		}
		
		public function set error(newValue:Boolean):void {
			if (newValue != error)
			{
				_error = newValue;
				
				if (hasEventListener("valueChanged"))
				{
					dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
				}
			}
		}
	}
}