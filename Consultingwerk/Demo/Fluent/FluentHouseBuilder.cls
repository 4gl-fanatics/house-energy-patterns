
 /*------------------------------------------------------------------------
    File        : FluentHouseBuilder
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : lutzf
    Created     : Sat Sep 16 02:25:25 CEST 2023
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Consultingwerk.Demo.Decorator.*.
using Consultingwerk.Demo.Fluent.*.

class Consultingwerk.Demo.Fluent.FluentHouseBuilder implements IFluentHouseBuilder:

    define private variable lHeatPump as logical no-undo.
    define private variable lInsulation as logical no-undo.
    define private variable lSolar as logical no-undo.

    define public property House as IHouse no-undo
    get():
        define variable oHouse as IHouse no-undo.
        oHouse = new BasicHouse().

        if lInsulation then
            oHouse = new InsulatedHouse(oHouse).

        if lHeatPump then
            oHouse = new HeatPumpHouse(oHouse).

        if lSolar then
            oHouse = new SolarPoweredHouse(oHouse).

        return oHouse.
    end get.
    set.

    method public Consultingwerk.Demo.Fluent.IFluentHouseBuilder AddHeatPump( input plHeatPump as logical ):

        lHeatPump = plHeatPump.

        return this-object.

    end method.

    method public Consultingwerk.Demo.Fluent.IFluentHouseBuilder AddInsulation( input plInsulation as logical ):

        lInsulation = plInsulation.

        return this-object.

    end method.

    method public Consultingwerk.Demo.Fluent.IFluentHouseBuilder AddSolar( input plSolar as logical ):

        lSolar = plSolar.

        return this-object.

    end method.

    method static public IFluentHouseBuilder Build(  ):

        define variable oBuilder as IFluentHouseBuilder no-undo.
        oBuilder = new FluentHouseBuilder().

        return oBuilder.

    end method.

end class.