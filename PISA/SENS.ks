
//PISA V1.0


CLEARSCREEN.
//BOOT ANIMATION

WAIT 1.
CLEARSCREEN.

PRINT "Running PISA v1.0".
PRINT "Printing-Infos-Sounds-Awesome.".

UNTIL 0 {


//READOUT

//PANELS
PRINT "PANELS: " AT (1,3).
IF PANELS PRINT "STATUS: EXTENDED" AT(1,4).
ELSE PRINT "STATUS: RETRACTED" AT(1,4).
PRINT "SUN EXPOSURE: " + (SHIP:SENSORS:LIGHT)*(50) + "%" AT(1,5).

//SAS
PRINT "SAS: " AT (1,7).
IF SAS PRINT "STATUS: ON " AT(1,8).
ELSE PRINT "STATUS: OFF" AT(1,8).

IF SAS PRINT "SASMODE: " + SASMODE AT(1,9).
ELSE PRINT "     " AT(1,9).

//RCS

PRINT "RCS: " AT (1,11).
IF RCS PRINT "STATUS: ON " AT(1,12).
ELSE PRINT "STATUS: OFF" AT(1,12).

//CHUTES

PRINT "CHUTES: " AT (1,14).
IF CHUTES PRINT "STATUS: ON " AT(1,15).
ELSE PRINT "STATUS: OFF" AT(1,15).


//GEARS

PRINT "GEARS: " AT (1,17).
IF GEAR PRINT "STATUS: ON " AT(1,18).
ELSE PRINT "STATUS: OFF" AT(1,18).

//LEGS

PRINT "LEGS: " AT (1,20).
IF LEGS PRINT "STATUS: ON " AT(1,21).
ELSE PRINT "STATUS: OFF" AT(1,21).


//LADDERS

PRINT "LADDERS: " AT (1,23).
IF LADDERS PRINT "STATUS: ON " AT(1,24).
ELSE PRINT "STATUS: OFF" AT(1,24).

//BAYS

PRINT "BAYS: " AT (1,26).
IF BAYS PRINT "STATUS: ON " AT(1,27).
ELSE PRINT "STATUS: OFF" AT(1,27).

//LIGHTS





//REFRESH RATE

WAIT 0.1.
CLEARSCREEN.

}



