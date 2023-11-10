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
    File        : HouseBuilder
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : lutzf
    Created     : Fri Sep 15 16:16:05 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Consultingwerk.Demo.Factory.*.
using Consultingwerk.Demo.Decorator.*.

class Consultingwerk.Demo.Factory.HouseBuilder
    abstract
    implements IHouseBuilder :

    /* Variables to store configuration about the object to be built */
    define protected variable lHasHeatPump as logical no-undo.
    define protected variable lHasInsulation as logical no-undo.
    define protected variable lHasSolar as logical no-undo.

    define public property House as IHouse no-undo
    get():
        return this-object:GetInstance().
    end get.

    method abstract protected IHouse GetInstance().

    /* Returns an instance of IHouseBuilder */
    method static public IHouseBuilder Build (pcHouseCategory as character):

        case pcHouseCategory:
            when "modern" then  return new ModernHouseBuilder().
            when "basic" then return new BasicHouseBuilder().
            otherwise return new DefaultHouseBuilder().
        end case.

    end method.

    method public void AddHeatPump( input plHeatPump as logical ):

        lHasHeatPump = plHeatPump.

    end method.

    method public void AddInsulation( input plInsulation as logical ):

        lHasInsulation = plInsulation.

    end method.

    method public void AddSolar( input plSolar as logical ):

        lHasSolar = plSolar.

    end method.

end class.