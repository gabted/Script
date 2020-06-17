//ANTENNA dish.tatsujin
SET P TO SHIP:PARTSNAMED("dish.tatsujin")[0].
SET M TO P:GETMODULE("ModuleRTAntenna").

Until False {
	Set oldTarget to M:GETFIELD("target").
	
	Set NearestSat to VESSEL(oldTarget).
	List target in vessels.
	 for currentSat in vessels {
		if currentSat:name:FIND("comm") <> -1 {
			if currentSat:position:mag <= NearestSat:position:mag {
				set nearestSat to currentSat.
			}
		}
	 }
	 
	PRINT "TRYING TO CONNECT TO "+nearestSat:name.
	M:SETFIELD("target", nearestSat:name).
	WAIT 0.5.
	if ADDONS:RT:HASKSCCONNECTION(SHIP) {
		PRINT "CONNECTED TO "+nearestSat:name.
	}
	ELSE { 
		PRINT "RESTORING CONNECTION TO "+oldTarget.
		M:SETFIELD("target", oldTarget).
	}
	

	WAIT 20.
}