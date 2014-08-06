package clases
{
	import mx.formatters.DateFormatter;

	public class ConvertFechaToDate
	{
		[Bindable][Inspectable(defaultValue="00-00-0000")] private var LaFecha:String;
		
		public function ConvertFechaToDate()
		{
		}
		
		public function FechaToDate(fecha:String):Date 
		{
			var FechaDate:Date;
			if(fecha != null && fecha != "") 
			{
				LaFecha = fecha.substr(8,2) + "-" + fecha.substr(5,2) + "-" + fecha.substr(0,4);
				FechaDate = new Date(Number(LaFecha.substr(6,4)), Number(LaFecha.substr(3,2))-1, Number(LaFecha.substr(0,2)));
			} 
			else
			{
				LaFecha = null;
				FechaDate = null;
			}
			if(LaFecha == '00-00-0000') FechaDate = null;
			
			return FechaDate;
		}
		
		public function formatoFechaYYYYMMDD(item:Object):String 
		{ 
			var formatear:DateFormatter = new DateFormatter();
			formatear.formatString = "YYYY-MM-DD";
			return formatear.format(item);
		}
		
		public function formatoFechaDDMMYYYY(item:Object):String 
		{ 
			var formatear:DateFormatter = new DateFormatter();
			formatear.formatString = "DD-MM-YYYY";
			return formatear.format(item);
		}
	}
}