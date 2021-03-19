
CLEARSCREEN.



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
//SET DESTINATION TO LATLNG(here:LAT-0.05,here:LNG).
SET DESTINATION TO VESSEL("RINCO V1").
PRINT "DISTanzaa: ".
print DESTINATION:DISTANCE.


SET ARRIVATI TO FALSE.

WHEN DESTINATION:DISTANCE < 10 THEN {
    SET ARRIVATI TO TRUE.
    BRAKES ON.
    LOCK WHEELTHROTTLE TO -1.
    WAIT UNTIL ship:GROUNDSPEED <= 1.
    LOCK WHEELTHROTTLE TO 0.
    PRINT "DESTINAZIONE RAGGIUNTA".
}


//START LOOP
UNTIL(ARRIVATI) {
PRINT "DISTanzaa: ".
print DESTINATION:DISTANCE.
LOCK WHEELSTEERING TO DESTINATION.
BRAKES OFF.
LOCK WHEELTHROTTLE TO 0.05.
//WAIT FOR STABILIZATION
UNTIL (VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION) < 5) {
    PRINT "fase di puntamento.".
   print "distanza: "+DESTINATION:DISTANCE.
    PRINT "scostamento: "+VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION).
     WAIT 0.5.
}.
wait 5.

//advancing
UNLOCK WHEELSTEERING.
LOCK WHEELTHROTTLE TO 0.8.
PRINT "CROCIERA".

//adjusting
UNTIl (VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION) > 30){
    PRINT "fase di crociera. ".
    print "distanza: "+DESTINATION:DISTANCE.
    PRINT "scostamento: "+VANG(SHIP:FACING:FOREVECTOR, DESTINATION:POSITION).
    WAIT 0.5.
}.
BRAKES ON.
PRINT "AGGIUSTAMENTO ROTTA".
LOCK WHEELTHROTTLE TO -1.
WAIT UNTIL ship:GROUNDSPEED <= 1.
LOCK WHEELTHROTTLE TO 0.
WAIT 3.
}




//end
BRAKES ON.
UNLOCK WHEELSTEERING.
UNLOCK WHEELTHROTTLE.