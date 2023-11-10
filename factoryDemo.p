
/*------------------------------------------------------------------------
    File        : factoryDemo.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : Lutz Fechner
    Created     : Fri Sep 15 16:31:23 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Demo.Decorator.*.
USING Consultingwerk.Demo.Factory.*.

DEFINE VARIABLE oHouse AS IHouse NO-UNDO.

/* ***************************  Main Block  *************************** */

oHouse = HouseBuilder:Build(""):House. //you don't see who build the object for you
DISPLAY "Basic House Energy Consuption: " oHouse:GetEndEnergyConsumption() SKIP.

oHouse = HouseBuilder:Build("modern"):House. //you don't see who build the object for you
DISPLAY "Modern House Energy Consuption: " oHouse:GetEndEnergyConsumption().


oHouse = NEW ClassWithUglyConstructor(FALSE, 
                                      FALSE,
                                      "", 
                                      5, 
                                      12.0, 
                                      6, 
                                      TRUE, 
                                      TRUE, 
                                      5, 
                                      6, 
                                      "WTF", 
                                      FALSE, 
                                      FALSE).
