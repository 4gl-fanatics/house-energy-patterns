 
 /*------------------------------------------------------------------------
    File        : DefaultHouseBuilder
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : lutzf
    Created     : Fri Sep 15 16:22:01 CEST 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Demo.Factory.*.
USING Consultingwerk.Demo.Decorator.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.Demo.Factory.DefaultHouseBuilder INHERITS HouseBuilder: 
    METHOD PROTECTED OVERRIDE IHouse GetInstance():
         DEFINE VARIABLE oHouse AS IHouse NO-UNDO.
            oHouse = new BasicHouse().
         RETURN oHouse.
     END METHOD.
END CLASS.