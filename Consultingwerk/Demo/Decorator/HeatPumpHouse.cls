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
    File        : HeatPumpHouse
    Purpose     :
    Syntax      :
    Description : A House with a Heat Pump
    Author(s)   : Lutz Fechner
    Created     : Fri Sep 15 11:04:34 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Consultingwerk.Demo.Decorator.*.

class Consultingwerk.Demo.Decorator.HeatPumpHouse
    inherits HouseDecorator:

    // Coefficient of Performance - How much energy returned for energy put in
    define public property CoefficientOfPerformance as integer no-undo
    get.
    protected set.

    constructor public HeatPumpHouse(pHouse as IHouse):
        super(pHouse).

        this-object:CoefficientOfPerformance = 4.
    end constructor.

    method override public integer GetEndEnergyConsumption(  ):

        return integer(super:GetEndEnergyConsumption() / this-object:CoefficientOfPerformance).

    end method.

end class.