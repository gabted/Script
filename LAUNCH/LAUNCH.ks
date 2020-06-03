
//BOOT AND PRELAUNCH
//51 LIGHTS

//53 FIZZLE - STAGE
//54 CREW TOWER
//55 VENTS
//56 SOLIDS



CLEARSCREEN.
SWITCH TO 0. 
CD(LAUNCH).


WAIT 2.

PRINT "LAUNCH SEQUENCE HAS STARTED".

WAIT 1.

//CONN STATUS

WAIT 1.

if ADDONS:RT:HASKSCCONNECTION(SHIP) {

PRINT "STATUS:CONNECTED TO KSC".

PRINT "DELAY CONNECTION IS: " + ADDONS:RT:DELAY(SHIP).


}


//CONNECTION TROUBLE-SHOOTING

//ELSE1

ELSE

{ 

PRINT "CONNECTION PROBLEM, UNABLE TO CONNECT TO KSC MAINFRAME". 

WAIT 1.

PRINT "LAUNCH SEQUENCE ABORTED".

WAIT 1.

PRINT "REBOOT IN 3 SECONDS".

WAIT 2.

REBOOT.

}


SWITCH TO 0.


WAIT 1.
PRINT SHIP:NAME.
WAIT 1.
PRINT SHIP:STATUS.
WAIT 1.


AG51 ON. //LIGHTS


PRINT "CLOSING VENTS".  //VENTS

AG55 ON.

WAIT 2.

PRINT "RETRACTING CREW RAMP".   //CREW
 
AG54 ON.

WAIT 3. 

PRINT "RELEASING CLAMPS".

STAGE.

WAIT 2.

STAGE.

WAIT 2.

PRINT "STARTING FIRING DEVICES". //FIZZLES

STAGE.

WAIT 5.

PRINT "READY TO LAUNCH".

WAIT 3.

PRINT "LAUNCH!".

STAGE.

//END
//RUN LIFTOFF AND LES

SWITCH TO 0.
CD(LAUNCH).
RUN LIFTOFF.







