
/*------------------------------------------------------------------------
    File        : IHouseBuilder
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : lutzf
    Created     : Fri Sep 15 16:09:33 CEST 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Demo.Decorator.*.

INTERFACE Consultingwerk.Demo.Factory.IHouseBuilder:  
    
    DEFINE PUBLIC PROPERTY House AS IHouse NO-UNDO
    GET.
  
END INTERFACE.