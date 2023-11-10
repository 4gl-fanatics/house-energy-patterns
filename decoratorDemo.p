/*
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>
*/
/*------------------------------------------------------------------------
    File        : decoratorDemo.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   : Lutz Fechner
    Created     : Fri Sep 15 10:46:16 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Demo.Decorator.* FROM PROPATH.

DEFINE VARIABLE oHouse          AS IHouse NO-UNDO.
DEFINE VARIABLE oSpecialHouse   AS IHouse NO-UNDO.
/* ***************************  Main Block  *************************** */

//CURRENT-WINDOW:WIDTH = 320.

//a basic house
oHouse = NEW BasicHouse().
DISPLAY "Basic House Energy Consumption is: " oHouse:GetEndEnergyConsumption() "kWh/year" SKIP WITH WIDTH 320.

//add insulation
oHouse = NEW InsulatedHouse(oHouse).
DISPLAY "Insulated House Energy Consumption is: " oHouse:GetEndEnergyConsumption() "kWh/year" SKIP WITH WIDTH 320.

//replace gas stove with heat pump
oHouse = NEW HeatPumpHouse(oHouse).
DISPLAY "Energy Consumption with Heat Pump and Insulation is: " oHouse:GetEndEnergyConsumption() "kWh/year" SKIP WITH WIDTH 320.

//install some solar panels
oHouse = NEW SolarPoweredHouse(oHouse).
DISPLAY "Energy Consumption after solar installation drops to: " oHouse:GetEndEnergyConsumption() "kWh/year" SKIP WITH WIDTH 320.

//this uses a derived class with overrides (the specialization is static).
oSpecialHouse = NEW HouseWithHeatPumpAndSolar().
DISPLAY "Energy Consumption of House with Heat Pump and Solar is: " oSpecialHouse:GetEndEnergyConsumption() "kWh/year" SKIP WITH WIDTH 320.

catch e as Progress.Lang.Error:
    message e:GetMessage(1).
end catch.