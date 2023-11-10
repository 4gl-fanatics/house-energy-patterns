 
 /*------------------------------------------------------------------------
    File        : ClassicalHouseBuilder
    Purpose     : Sample code 
    Syntax      : 
    Description : Shows pattern implementeation (Builder)
    Author(s)   : Lutz Fechner
    Created     : Thu Sep 21 09:54:42 CEST 2023
    Notes       : KISS
  ----------------------------------------------------------------------*/

USING Consultingwerk.Demo.Decorator.*.
USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.Demo.Factory.ClassicalHouseBuilder: 
    
    DEFINE PRIVATE VARIABLE lInsulated  AS LOGICAL.
    DEFINE PRIVATE VARIABLE lHeatPump   AS LOGICAL.
    DEFINE PRIVATE VARIABLE lSolar      AS LOGICAL.
    
    CONSTRUCTOR PUBLIC ClassicalHouseBuilder():
        
    END CONSTRUCTOR. 
    
    METHOD PUBLIC VOID AddInsulation(pInsulated AS LOGICAL):
         lInsulated = pInsulated.
    END METHOD.
    
    METHOD PUBLIC VOID AddHeatPump(pHeatPump AS LOGICAL):
        lHeatPump = pHeatPump.
    END METHOD.
    
    METHOD PUBLIC VOID AddSolar(pSolar AS LOGICAL):
        lSolar = pSolar.
    END METHOD.
    
    METHOD PUBLIC IHouse Build():
        
        DEFINE VARIABLE oHouse AS IHouse.
        oHouse = NEW BasicHouse().
        
        IF lInsulated THEN
            oHouse = NEW InsulatedHouse(oHouse). // we are decorating here
        
        IF lHeatPump THEN
            oHouse = NEW HeatPumpHouse(oHouse). // we are decorating here again
        
        IF lSolar THEN
            oHouse = NEW SolarPoweredHouse(oHouse). // and again
        
        RETURN oHouse.
        
    END METHOD.
    
END CLASS.