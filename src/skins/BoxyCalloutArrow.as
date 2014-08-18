package skins
{
import spark.skins.mobile.supportClasses.CalloutArrow;

public class BoxyCalloutArrow extends CalloutArrow
{
    public function BoxyCalloutArrow()
    {
        super();
        
        borderThickness = 0; 
        borderColor = 0xFFFFFF;//0x333333; 
        gap = 0;
        useBackgroundGradient = false;
    }
}
}