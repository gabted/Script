CLEARSCREEN.

//AG LIST:

//AG151 SMALL CHUTE
//AG152 BIG CHUTE
//AG153 AIRBAG
//AG154 SHIELD JETTISON
//AG155 CAPSULE DECOUPLE



//BOOT

WAIT 2.

PRINT "RE-ENTRY NODE INFO".

PRINT "OBTAINING REENTRY INFORMATIONS".

PRINT "LOADING.".

WAIT 2.

PRINT "LOADING..".

WAIT 2.

PRINT "LOADING...".

WAIT 3.


//LANDING INFORMATIONS

WAIT 0.01.

PRINT ADDONS:TR:IMPACTPOS.

//LOG ADDONS:TR:IMPACTPOS TO RNTRINFO.

WAIT 0.01.

SET SPOT TO ADDONS:TR:IMPACTPOS.

WAIT 0.01.

PRINT "LANDING AT: " + CEILING(SPOT:TERRAINHEIGHT) + " METERS".

PRINT ".".
PRINT ".".
PRINT ".".
PRINT ".".
PRINT ".".


PRINT "EXECUTE NODE THEN RUN -RENTR- FOR RE-ENTRY PROCEDURES".
 


