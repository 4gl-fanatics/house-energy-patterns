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