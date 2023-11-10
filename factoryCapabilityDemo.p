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
    File        : factoryDemo.p
    Purpose     :

    Syntax      :

    Description :

    Author(s)   : Peter Judge / Consultingwerk
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Consultingwerk.Demo.Decorator.*.
using Consultingwerk.Demo.Factory.*.

define variable oHouse as IHouse no-undo.
define variable oHouseBuilder as IHouseBuilder no-undo.

/* ***************************  Main Block  *************************** */

oHouseBuilder = HouseBuilder:Build("").

oHouseBuilder:AddHeatPump(true).

oHouse = oHouseBuilder:House.

display "Basic House Energy Consuption: " oHouse:GetEndEnergyConsumption() skip.

oHouse = HouseBuilder:Build("modern"):House. //you don't see who build the object for you
display "Modern House Energy Consuption: " oHouse:GetEndEnergyConsumption().
