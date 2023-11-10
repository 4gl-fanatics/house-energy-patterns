
/*------------------------------------------------------------------------
    File        : fluentDemo.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   : lutzf
    Created     : Sat Sep 16 02:32:27 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Demo.Decorator.* FROM PROPATH.
USING Consultingwerk.Demo.Fluent.FluentHouseBuilder FROM PROPATH.

DEFINE VARIABLE oHouse AS IHouse.

//basic house
oHouse = FluentHouseBuilder:Build()
                           :House.

oHouse = NEW BasicHouse().

DISPLAY "Basic House energy consumption:" oHouse:GetEndEnergyConsumption() SKIP.


//insulated house
oHouse = FluentHouseBuilder:Build()
                           :AddInsulation(TRUE)
                           :House.
DISPLAY "Insulated House energy consumption:" oHouse:GetEndEnergyConsumption() SKIP.


//insulated house with heat pump
oHouse = FluentHouseBuilder:Build()
                           :AddInsulation(TRUE)
                           :AddHeatPump(TRUE)
                           :House.
DISPLAY "After heat pump upgrade:" oHouse:GetEndEnergyConsumption() SKIP.

//insulated house with heat pump and solar
oHouse = FluentHouseBuilder:Build()
                           :AddInsulation(TRUE)
                           :AddSolar(TRUE)
                           :AddHeatPump(TRUE)
                           :House.
DISPLAY "After solar installation:" oHouse:GetEndEnergyConsumption() SKIP.


/* ***************************  Main Block  *************************** */
