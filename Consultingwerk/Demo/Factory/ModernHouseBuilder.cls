 
 /*------------------------------------------------------------------------
    File        : ModernHouseBuilder
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : lutzf
    Created     : Fri Sep 15 16:21:24 CEST 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Demo.Factory.HouseBuilder.
USING Consultingwerk.Demo.Decorator.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.Demo.Factory.ModernHouseBuilder INHERITS HouseBuilder: 

     METHOD PROTECTED OVERRIDE IHouse GetInstance():
         DEFINE VARIABLE oHouse AS IHouse NO-UNDO.
            // create a house
            oHouse = new BasicHouse().
            //decorate it
            oHouse = new InsulatedHouse(oHouse).
            oHouse = new HeatPumpHouse(oHouse).
            oHouse = new SolarPoweredHouse(oHouse).
         RETURN oHouse.
     END METHOD.

END CLASS.