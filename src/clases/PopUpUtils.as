/* AS3 file Autor Ing. Jesus Antonio Ramos Martinez  */
package clases
{
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.core.IChildList;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	public class PopUpUtils
	{
		/**
		 * Devuelve todos los pop-ups dentro de una aplicación. Sólo los popups cuya base
		 * sea la clase UIComponent.
		 *
		 * @parametro applicationInstance
		 *   Si el nombre de instancia de la aplicaciòn es diferente de null se utiliza.
		 * @parametro onlyVisible
		 *   Si es cierto, considera sólo las ventanas emergentes visibles.
		 * @return Todos los popUps especificados por la aplicacion.
		 */
		public static function getAllPopups(applicationInstance: Object = null, onlyVisible: Boolean = false):ArrayCollection
		{
			var result: ArrayCollection = new ArrayCollection();
			
			if (applicationInstance == null)
			{
				// NOTE: Use esta linea para Flex 4.x y posterior
				applicationInstance = FlexGlobals.topLevelApplication;
				
				// NOTE: Use esta linea solo para Flex 3.x e inferior
				//applicationInstance = Application.application;
			}
			
			var rawChildren: IChildList = applicationInstance.systemManager.rawChildren;
			
			for (var i:int = 0; i < rawChildren.numChildren; i++)
			{
				var currRawChild:DisplayObject = rawChildren.getChildAt(i);
				
				if ((currRawChild is UIComponent) && UIComponent(currRawChild).isPopUp)
				{
					if (!onlyVisible || UIComponent(currRawChild).visible)
						result.addItem(currRawChild);
				}
			}
			
			return result;
		}
		
		/**
		 * Comprueba si una aplicación tiene popups visibles. Sólo los popups cuya base
		 * sea la clase UIComponent.
		 *
		 * @parametro applicationInstance
		 *   Si el nombre de instancia de la aplicaciòn es diferente de null se utiliza.
		 * @return True Si hay popUps visibles en la aplicacion espeficada en caso contrario regresa false;
		 *         false otherwise.
		 */
		public static function hasVisiblePopups(applicationInstance: Object = null):Boolean
		{
			if (applicationInstance == null)
			{
				// NOTE: Use esta linea para Flex 4.x y posterior
				applicationInstance = FlexGlobals.topLevelApplication;
				
				// NOTE: Use esta linea solo para Flex 3.x e inferior
				//applicationInstance = Application.application;
			}
			
			var rawChildren:IChildList = applicationInstance.systemManager.rawChildren;
			
			for (var i: int = 0; i < rawChildren.numChildren; i++)
			{
				var currRawChild: DisplayObject = rawChildren.getChildAt(i);
				
				if ((currRawChild is UIComponent) && UIComponent(currRawChild).isPopUp && UIComponent(currRawChild).visible)
					return true;
			}
			
			return false;
		}
		
		/**
		 * Cierra todas las ventanas emergentes que pertenecen a una aplicación. Sólo los pop-ups
		 * cuya base es pertenezca a la clase UIComponent.
		 *
		 * @parametro applicationInstance
		 *   Si el nombre de instancia de la aplicaciòn es diferente de null se utiliza.
		 * @return Void.
		 */
		public static function closeAllPopups(applicationInstance:Object = null):void
		{
			var allPopups: ArrayCollection = getAllPopups(applicationInstance);
			
			for each (var popUp:UIComponent in allPopups)
				PopUpManager.removePopUp(popUp);
		}
	}
}