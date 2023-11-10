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
    File        : run.p
    Purpose     :
    Syntax      :
    Description :
    Author(s)   : Peter Judge / Consultingwerk. Ltd.
    Created     :
    Notes       :
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using Example.Entertainment.* from propath.

define variable oSeat as ISeat no-undo.

/* Base seat (the one to decorate) */
oSeat = new Seat(true).

oSeat = new SeatControls("C150", oSeat).

/* Seat with screen : predefined screen */
oSeat = new Hd12801024TouchScreen(oSeat).

/* or build individual
*/
oSeat = new SeatScreen(800, 600, ResolutionEnum:StandardDefinition, false, false, oSeat).

oSeat:PlayChannel(ChannelTypeEnum:Radio, "WERS").

message 'TypeName ' oSeat:GetCLass():TypeName.
message 'type-of ISeat? ' type-of(oSeat, ISeat).
message 'type-of ISeatScreen? ' type-of(oSeat, ISeatScreen).

if type-of(oSeat, ISeatScreen) then do:
    message 'Screen details: ' substitute('&1x&2@&3', cast(oSeat, ISeatScreen):Height, cast(oSeat, ISeatScreen):Width, string(cast(oSeat, ISeatScreen):Resolution)).

    //cast(oSeat, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Radio, "WBUR").
    cast(oSeat, ISeatScreen):PlayPipChannel(ChannelTypeEnum:Tv, "BBC1").
end.
