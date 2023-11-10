
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
    File        : run-adapter.p
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Peter Judge / Consultingwerk. Ltd.
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Example.Entertainment.* from propath.
using OpenEdge.Core.* from propath.

define variable oSeat as ISeat no-undo.
define variable oAdapter as Progress.Lang.Object no-undo.
define variable lCanShowPiP as logical no-undo.

/* Base seat */
oSeat = new Seat(true).

oSeat = new SeatControls("C150", oSeat).

/* SD screen */
lCanShowPiP = false.
oSeat = new SeatScreen(800, 600, ResolutionEnum:StandardDefinition, lCanShowPiP, false, oSeat).

/* and can cast */
oSeat = new SeatCast(oSeat).

oSeat:PlayChannel(ChannelTypeEnum:Radio, "WERS").

message 'TypeName ' oSeat:GetCLass():TypeName.
message 'type-of ISeat? ' type-of(oSeat, ISeat).
message 'type-of ISeatScreen? ' type-of(oSeat, ISeatScreen).

if type-of(oSeat, ISeatScreen) then do:
    message cast(oSeat, ISeatScreen):Height "x" cast(oSeat, ISeatScreen):Width " @ " string(cast(oSeat, ISeatScreen):Resolution).
end.

if type-of(oSeat, IAdaptable) then do:
    oAdapter = cast(oSeat, IAdaptable):GetAdapter(get-class(ISeatScreen)).

    message 'adapts to ISeatScreen? ' valid-object(oAdapter).
    if valid-object(oAdapter) then do:
        message 'Screen details: ' substitute('&1x&2@&3', cast(oAdapter, ISeatScreen):Height, cast(oAdapter, ISeatScreen):Width, string(cast(oAdapter, ISeatScreen):Resolution)).

        cast(oAdapter, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Map, "Europe").
    end.
end.
