
/*------------------------------------------------------------------------
    File        : classicalBuilderDemo.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   : Lutz Fechner
    Created     : Thu Sep 21 10:08:31 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

USING Consultingwerk.Demo.Factory.*.
USING Consultingwerk.Demo.Decorator.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

DEFINE VARIABLE oHouseBuilder   AS ClassicalHouseBuilder NO-UNDO.
DEFINE VARIABLE oHouse          AS IHouse                NO-UNDO.

oHouseBuilder = NEW ClassicalHouseBuilder().

oHouseBuilder:AddInsulation(TRUE).
oHouseBuilder:AddHeatPump(FALSE).
oHouseBuilder:AddSolar(TRUE).

oHouse = oHouseBuilder:Build().

DISPLAY "HouseBuilder built House energy consumption" oHouse:GetEndEnergyConsumption() "kWh/a".



