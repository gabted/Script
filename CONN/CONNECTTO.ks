CLEARSCREEN.

PARAMETER newTarget.

//ANTENNA dish.tatsujin
SET P TO SHIP:PARTSNAMED("dish.tatsujin")[0].
SET M TO P:GETMODULE("ModuleRTAntenna").
SET oldTarget TO M:GETFIELD("target").

PRINT "TRYING TO CONNECT TO "=newTarget.
M:SETFIELD("target", newTarget).
WAIT 0.5.
if ADDONS:RT:HASKSCCONNECTION(SHIP) {
	PRINT "CONNECTED TO "=newTarget.
}
ELSE { 
	PRINT "RESTORING CONNECTION TO "+oldTarget.
	M:SETFIELD("target", oldTarget).
}