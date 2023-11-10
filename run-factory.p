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
    File        : run-factory.p
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Peter Judge / Consultingwerk. Ltd.
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/


using Example.Entertainment.Builder.* from propath.
using Example.Entertainment.* from propath.

define variable oA380EconomySeat as ISeat no-undo.
define variable oA380BusinessSeat as ISeat no-undo.
define variable oSeatBuilder     as ISeatBuilder no-undo.

oSeatBuilder = SeatBuilder:Build().

oSeatBuilder:AddScreen(1280, 1024).
oSeatBuilder:SetScreenResolution(ResolutionEnum:HighDefinition).
oSeatBuilder:SupportsTouch(yes).
oSeatBuilder:SupportsPictureInPicture(yes).
oSeatBuilder:EnableBluetooth(no).
oSeatBuilder:ControllerModel("C250").

oA380EconomySeat = oSeatBuilder:Seat.

oA380EconomySeat = SeatBuilder:Build("economy-001"):Seat.

oA380BusinessSeat = SeatBuilder:Build()
                    :EnableBluetooth(yes)
                    :AddScreen(2560, 1440)
                    :SetScreenResolution(ResolutionEnum:FourK)
                    :SupportsPictureInPicture(yes)
                    :SupportsTouch(yes)
                    :ControllerModel("C100")
                    :SupportsCast(yes)
                    :Seat.

message  "A380 Business".
message 'TypeName ' oA380BusinessSeat:GetClass():TypeName.
message 'type-of ISeat? ' type-of(oA380BusinessSeat, ISeat).
message 'type-of ISeatScreen? ' type-of(oA380BusinessSeat, ISeatScreen).

if type-of(oA380BusinessSeat, ISeatScreen) then do:
    message 'Screen details: ' substitute('&1x&2@&3', cast(oA380BusinessSeat, ISeatScreen):Height, cast(oA380BusinessSeat, ISeatScreen):Width, string(cast(oA380BusinessSeat, ISeatScreen):Resolution)).

    //cast(oSeat, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Radio, "WBUR").
    cast(oA380BusinessSeat, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Tv, "BBC1").
end.


message  "A380 Economy".
message 'TypeName ' oA380EconomySeat:GetCLass():TypeName.
message 'type-of ISeat? ' type-of(oA380EconomySeat, ISeat).
message 'type-of ISeatScreen? ' type-of(oA380EconomySeat, ISeatScreen).

if type-of(oA380EconomySeat, ISeatScreen) then do:
    message 'Screen details: ' substitute('&1x&2@&3', cast(oA380EconomySeat, ISeatScreen):Height, cast(oA380EconomySeat, ISeatScreen):Width, string(cast(oA380EconomySeat, ISeatScreen):Resolution)).

    cast(oA380EconomySeat, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Tv, "BBC1").
end.
