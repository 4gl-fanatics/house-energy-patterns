
/*------------------------------------------------------------------------
    File        : IFluentHouseBuilder
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : lutzf
    Created     : Sat Sep 16 02:06:46 CEST 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Demo.Fluent.IFluentHouseBuilder FROM PROPATH.
USING Consultingwerk.Demo.Decorator.*.

INTERFACE Consultingwerk.Demo.Fluent.IFluentHouseBuilder:
    
    METHOD PUBLIC IFluentHouseBuilder AddInsulation(plInsulation AS LOGICAL).
    
    METHOD PUBLIC IFluentHouseBuilder AddHeatPump(plHeatPump AS LOGICAL).
    
    METHOD PUBLIC IFluentHouseBuilder AddSolar(plSolar AS LOGICAL).
    
    DEFINE PUBLIC PROPERTY House AS IHouse NO-UNDO
    GET.
  
END INTERFACE.