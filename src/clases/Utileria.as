/**
 * @version: 1.0
 * @author: ING. JESUS ANTONIO RAMOS MARTINEZ.
 * @TODO: Los metodos utilizados en SISv2 se encuentra aqui.
 * El uso de todos tiene interface publica sin la propiedad [Bindable]. 
 * [Bindable] NO garantiza la protección de los mismos al momento de obtener los datos.
 */
package clases
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import loaders.Progress;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.core.FlexGlobals;
	import mx.events.PropertyChangeEvent;
	import mx.managers.PopUpManager;
	import mx.utils.StringUtil;
	
	import renders.CustomAlert;
	
	public class Utileria extends EventDispatcher
	{
		private var _coincidencias:Array;
		public var progress:Progress;
		
		public function Utileria(){}
		
		internal static function format(dateString:String):Date {
			if ( dateString == null ) {
				return null;
			}
			
			if ( dateString.indexOf("0000-00-00") != -1 ) {
				return null;
			}
			
			dateString = dateString.split("-").join("/");
			
			return new Date(Date.parse( dateString ));
		}
		
		internal static function position(Arr:Array, Str:String):Number {
			for (var i:int = 0; i < Arr.length; i++) {
				if (Arr[i].value == Str) {
					return i;
				}
			}
			return -1;
		}
		
		public static function group(Arr:ArrayCollection):Array{
			var info:Array = new Array();
			var memory:Array = new Array();
			for (var i:int = 0; i < Arr.length; i++) {            
				if (position(memory, Arr[i].marca) == -1) {
					memory.push({value:Arr[i].marca});
					info.push({value:Arr[i].marca});
				}
			}
			memory = null;
			info.sortOn(['value']);
			return info;
		}
		
		public static function newSibling(sourceObj:Object):* 
		{
			if(sourceObj) 
			{
				var objSibling:*;
				try 
				{
					var classOfSourceObj:Class = getDefinitionByName(getQualifiedClassName(sourceObj)) as Class;
					objSibling = new classOfSourceObj();
				}
				catch(e:Object){}
				
				return objSibling;
			}
			return null;
		}
		
		public static function clone(source:Object):Object
		{
			var clone:Object;
			if(source) 
			{
				clone = newSibling(source);
				
				if(clone) 
					copyData(source, clone);
			}
			return clone;
		}
		
		public static function clonar(source:Object):*
		{
			//Esta funcion copia los datos con las propiedades  de cada objeto 
			var myByteArray:ByteArray = new ByteArray();
			myByteArray.writeObject(source);
			myByteArray.position = 0;
			source  = null;
			return(myByteArray.readObject());
		}
		
		public static function copyData(source:Object, destination:Object):void 
		{
			//Esta funcion copia los datos de las propiedades  getter/setter
			if((source) && (destination)) 
			{
				try 
				{
					var sourceInfo:XML = describeType(source);
					var prop:XML;
					
					for each(prop in sourceInfo.variable) 
					{
						
						if(destination.hasOwnProperty(prop.@name)) 
							destination[prop.@name] = source[prop.@name];
					}
					
					for each(prop in sourceInfo.accessor) 
					{
						if(prop.@access == "readwrite") {
							if(destination.hasOwnProperty(prop.@name)) 
								destination[prop.@name] = source[prop.@name];
						}
					}
				}
				catch (err:Object) 
				{
					;
				}
			}
		}
		//year to second sirve para un tipo de dato date pra que bamas traiga el mes año dia hora
		public function unirDatos(item:Object):String 
		{
			return item.data + " - " + item.label;
		}
		
		public static function DateToday():Date
		{
			var fecha:Date = new Date();
			return new Date((fecha.fullYear + "/" + ((fecha.month) + 1)  + "/" + fecha.date).toString());
		}
		
		public function findMatchesByID(ID:int, array:ArrayCollection, columnName:String):Object
		{
			coincidencias = findInCollection(array, findFunction(columnName, ID));
			if(coincidencias != null && coincidencias.length == 1)
				return coincidencias[0];	
			else
				return null;
		}
		
		public function findMatchesByStringID(ID:String, array:ArrayCollection, columnName:String):Object
		{
			coincidencias = findInCollection(array, findFunction(columnName, ID));
			if(coincidencias != null && coincidencias.length == 1)
				return coincidencias[0];	
			else
				return null;
		}
		
		public function findMatchesByIDReturnArray(ID:int, array:ArrayCollection, columnName:String):Array
		{
			coincidencias = findInCollection(array, findFunction(columnName, ID));
			if(coincidencias != null && coincidencias.length == 1)
			{
				return coincidencias;	
			}
			else
				return null;
		}
		
		public function findMatchesByIDReturnArrayForCatalog(ID:int, arrayOriginal:ArrayCollection, columnName:String):Array
		{
			coincidencias = new Array();
			coincidencias = findInCollection(arrayOriginal, findFunction(columnName, ID));
			
			if(coincidencias != null && coincidencias.length > 0)
				return coincidencias;	
			else
				return null;
		}
		
		public function findMatchesByObjectNameAndPropertyName(propertyValue1:*, arrayOriginal:ArrayCollection, objectName1:String, propertyName1:String, propertyValue2:*, objectName2:String, propertyName2:String, propertyValue3:*, propertyName3:String):Array
		{
			coincidencias = new Array();
			coincidencias = findInCollection(arrayOriginal, findFunctionInChildCollection(objectName1, propertyName1, propertyValue1, objectName2, propertyName2, propertyValue2, propertyName3, propertyValue3));
			
			if(coincidencias != null && coincidencias.length > 0)
				return coincidencias;	
			else
				return null;
		}
		
		protected function findInCollection(columna:ArrayCollection, findFunction:Function):Array
		{
			return columna.source.filter(findFunction);
		}
		
		protected function findFunction(propertyName:String, propertyValue:*):Function
		{
			return function(element:*, index:int, array:Array):Boolean
			{
				return element[propertyName] == propertyValue;
			}
		}
		
		protected function findFunctionInChildCollection(objectName1:String, propertyName1:String, propertyValue1:*, objectName2:String, propertyName2:String, propertyValue2:*, propertyName3:String, propertyValue3:*):Function
		{
			return function(element:*, index:int, array:Array):Boolean
			{
				return element[objectName1][propertyName1] == propertyValue1 && element[objectName2][propertyName2] == propertyValue2 && element[propertyName3] == propertyValue3;
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get coincidencias():Array
		{
			return _coincidencias;
		}
		
		public function set coincidencias(value:Array):void
		{
			var oldValue:Array = _coincidencias;
			if (oldValue !== value)
				_coincidencias = value;
			dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE));
		}
		
		public function myStyleFunc(data:Object,col:AdvancedDataGridColumn):Object 
		{
			try
			{
				if(data.thisItem.isError == true) 
					return {color:0xFF0000}; 
			}
			catch(error:Error){}
			return null;
		}
		
		public function showLoading(mensaje:String, operation:uint = 0):void 
		{ 
			progress = new Progress();
			progress.message(mensaje);
			PopUpManager.addPopUp(progress, FlexGlobals.topLevelApplication as DisplayObject, true);
			PopUpManager.centerPopUp(progress);
		}
		
		
		public function avance():void 
		{ 
			progress = new Progress();
			PopUpManager.addPopUp(progress, FlexGlobals.topLevelApplication as DisplayObject, true);
			PopUpManager.centerPopUp(progress);
		}
		
		public function alert(msj:String):void 
		{ 
			var alert:CustomAlert = new CustomAlert();
			alert.msj = msj;
			PopUpManager.addPopUp(alert, FlexGlobals.topLevelApplication as DisplayObject, true);
			PopUpManager.centerPopUp(alert);
		}
		
		private var campo:String, valor:String;
		public var campos:String, valores:String;
		public function obtenerCamposValores(lista:IList):void
		{
			campo = ""; 
			valor = "";
			campos = "";
			valores = "";
			var index:uint = 0;
			for each(var value:Object in lista.toArray())
			{
				campo = StringUtil.trim(value.split("=")[0]);
				valor = StringUtil.trim(value.split("=")[1]);
				if(index == 0) 
				{
					campos += campo;
					valores += valor;
					index++;
				}
				else
				{
					campos += " ," + campo;
					valores += " ," + valor;
				}
			}
		}
		
		public var listaQuerys:IList = new ArrayList();
		public function queryMasivo(query:String):void
		{
			listaQuerys.addItem(query);
		}
		
		public static function get defaultValue():int
		{
			return 0;
		}
		
		/** Esta funcion permite comparar 2 Fechas y validar SI una es MAYOR que la otra o si son IGUALES, la funcion retorna lo siguiente:
		1 - fecha1 es mayor que fecha2, 
		0 - fecha1 es igual a la fecha2, 
		2 - fecha1 es menor que fecha2 */
		public function compararFechas(fecha1:Date, fecha2:Date):uint
		{
			if(fecha1.time > fecha2.time)
				return 1;
			else if(fecha1.time < fecha2.time)
				return 2;
			else return 0;
			/*var ano:uint, mes:uint, dia:uint;
			ano = fecha1.split("-")[0] - fecha2.split("-")[0];//Compara los años.
			mes = fecha1.split("-")[1] - fecha2.split("-")[1];//Compara los meses.
			dia = fecha1.split("-")[2] - fecha2.split("-")[2];//Compara los dias.
			if(ano < 0)  return 2;
			else if(ano > 0) return 1;
			else if(mes < 0) return 2;
			else if(mes > 0) return 1;
			else if(dia < 0) return 2;
			else if(dia > 0) return 1;
			else    return 0;*/
		}
		
		public function returnHoraMinutosSegundos(fecha:Date):String
		{
			var horaMinutosSegundos:String;
			fecha.hours > 10 ? horaMinutosSegundos = fecha.hours.toString() : horaMinutosSegundos = "0" + fecha.hours;
			fecha.minutes > 10 ? horaMinutosSegundos += ":" + fecha.minutes : horaMinutosSegundos += ":0" + fecha.minutes;
			fecha.seconds > 10 ? horaMinutosSegundos += ":" + fecha.seconds : horaMinutosSegundos += ":0" + fecha.seconds;
			return horaMinutosSegundos;
		}
	}
}