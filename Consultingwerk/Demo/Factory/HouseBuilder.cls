
 /*------------------------------------------------------------------------
    File        : HouseBuilder
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : lutzf
    Created     : Fri Sep 15 16:16:05 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Consultingwerk.Demo.Factory.*.
using Consultingwerk.Demo.Decorator.*.

block-level on error undo, throw.

class Consultingwerk.Demo.Factory.HouseBuilder
    abstract
    implements IHouseBuilder     :

    define public property House as IHouse no-undo
    get():
        return this-object:GetInstance().
    end get.

    method abstract protected IHouse GetInstance().

    method static public IHouseBuilder Build (pcHouseCategory as character):

        case pcHouseCategory:
            when "modern" then  return new ModernHouseBuilder().
            when "basic" then return new DefaultHouseBuilder().
            otherwise return new DefaultHouseBuilder().
        end case.

    end method.

end class.