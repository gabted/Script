




function east_for {
  parameter ves is ship.

  return vcrs(ves:up:vector, ves:north:vector).
}


function compass_for {
  parameter ves is ship,thing is "default".

  local pointing is ves:facing:forevector.
  if not thing:istype("string") {
    set pointing to type_to_vector(ves,thing).
  }

  local east is east_for(ves).

  local trig_x is vdot(ves:north:vector, pointing).
  local trig_y is vdot(east, pointing).

  local result is arctan2(trig_y, trig_x).

  if result < 0 {
    return 360 + result.
  } else {
    return result.
  }
}


//pointing
SET here TO SHIP:GEOPOSITION.   
SET DESTINATION TO LATLNG(here:LAT+5,here:LNG+5).
PRINT "DISTanzaa: ".
print DESTINATION:DISTANCE.


SET ARRIVATI TO FALSE.

WHEN DESTINATION:DISTANCE < 20 THEN {
    SET ARRIVATI TO TRUE.
}

//START LOOP
UNTIL(ARRIVATI) {
PRINT "DISTanzaa: ".
print DESTINATION:DISTANCE.
LOCK WHEELSTEERING TO DESTINATION.
BRAKES OFF.
LOCK WHEELTHROTTLE TO 0.2.
//WAIT FOR STABILIZATION
WAIT UNTIL VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION) < 1.
wait until 5.

//advancing

UNLOCK WHEELSTEERING.
LOCK WHEELTHROTTLE TO 0.8.
PRINT "CROCIERA".

//adjusting
WAIT UNTIL VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION) > 30.
BRAKES ON.
PRINT "AGGIUSTAMENTO ROTTA".
LOCK WHEELTHROTTLE TO -0.5.
WAIT UNTIL ship:GROUNDSPEED >= 1.
LOCK WHEELTHROTTLE TO 0.
WAIT 3.
}

PRINT "DESTINAZIONE RAGGIUNTA".


//end
BRAKES ON.
UNLOCK WHEELSTEERING.
UNLOCK WHEELTHROTTLE.