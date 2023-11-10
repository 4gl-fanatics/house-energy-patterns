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
    File        : InsulatedHouse
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : lutzf
    Created     : Fri Sep 15 10:50:36 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Progress.Lang.*.
using Consultingwerk.Demo.Decorator.*.

class Consultingwerk.Demo.Decorator.InsulatedHouse
    inherits HouseDecorator:

    define public property RValue as integer no-undo
    get.
    protected set.

    constructor public InsulatedHouse(pHouse as IHouse):
        super(pHouse).

        this-object:RValue = 2 / 3.

    end constructor.

    method override public integer GetEndEnergyConsumption(  ):

        return integer(super:GetEndEnergyConsumption() * this-object:RValue).

    end method.

end class.