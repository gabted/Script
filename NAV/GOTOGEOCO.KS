




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
SET DESTINATION TO LATLNG(here:LAT+0.5,here:LNG+1).



SET ARRIVATI TO FALSE.

WHEN DESTINATION:DISTANCE < 20 THEN {
    SET ARRIVATI TO TRUE.
}

//START LOOP
UNTIL(not ARRIVATI) {

LOCK WHEELSTEERING TO DESTINATION.
BRAKES OFF.
LOCK WHEELTHROTTLE TO 0.2.
//WAIT FOR STABILIZATION

//advancing
UNLOCK WHEELSTEERING
SET WHEELTHROTTLE 0.8.


//adjusting
BRAKES ON.
SET WHEELTHROTTLE TO -0.5.
WAIT UNTIL ship:GROUNDSPEED >= 1.
SET WHEELTHROTTLE TO 0.
WAIT 3.
}

PRINT "DESTINAZIONE RAGGIUNTA".


//end
BRAKES ON.
UNLOCK WHEELSTEERING.
UNLOCK WHEELTHROTTLE.