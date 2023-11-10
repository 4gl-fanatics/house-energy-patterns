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
    File        : HouseDecorator
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Peter Judge / Consultingwerk. Ltd.
    Created     :
    Notes       : * There's a decent description of Decorator pattern in Wikipedia
                    at http://en.wikipedia.org/wiki/Decorator_pattern
                  * This class should be extended to provide specific functionality.
                    For instance, adding support for screens
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Consultingwerk.Demo.Decorator.*.
using OpenEdge.Core.* .

class Consultingwerk.Demo.Decorator.HouseDecorator
    abstract
    implements IHouse,
               OpenEdge.Core.IAdaptable:

    define variable oDecoratedHouse as IHouse no-undo.

    constructor public HouseDecorator(poHouse as IHouse):
        Assert:NotNull(poHouse).

        oDecoratedHouse = poHouse.
    end constructor.

    method public integer GetEndEnergyConsumption():
        return oDecoratedHouse:GetEndEnergyConsumption().
    end method.

    /* Returns an adapter for this Seat

       @param P.L.Class The type we want to adapt to
       @return P.L.Object The adapter. SHOULD be of the type specified by the input argument */
    method public Progress.Lang.Object GetAdapter(pAdaptTo as Progress.Lang.Class):
        /* Does the current decorator implement or inherit from the requested type? */
        if this-object:GetClass():IsA(pAdaptTo) then
            return this-object.

        if valid-object(oDecoratedHouse) then do:
            /* Does the decorated seat implement or inherit the requested type? */
            if oDecoratedHouse:GetClass():IsA(pAdaptTo) then
                return oDecoratedHouse.

            /* Is the decorated seat itself an Adapter? */
            if type-of(oDecoratedHouse, OpenEdge.Core.IAdaptable) then
                return cast(oDecoratedHouse, OpenEdge.Core.IAdaptable):GetAdapter(pAdaptTo).
        end.

        return ?.
    end method.

end class.