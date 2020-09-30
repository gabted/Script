
//LASER FRONTALE Y-BEND 3.5
SET laser_module TO SHIP:MODULESNAMED("LaserDistModule")[0].
IF not laser_module:GETFIELD("Enabled") {
  laser_module:SETFIELD("Enabled",true).
}.

//0.1 GRADI SONO CIRCA 150M??
//SET DESTINATION TO LATLNG(-0.1027,-74.5753).

SET here TO SHIP:GEOPOSITION.   
SET DESTINATION TO LATLNG(here:LAT,here:LNG+0.1).
LOCK WHEELSTEERING TO DESTINATION.
BRAKES OFF.
LOCK WHEELTHROTTLE TO 1.
AG1 OFF.
UNTIL DESTINATION:DISTANCE < 50 {
	PRINT DESTINATION:DISTANCE.
	PRINT "Laser is hitting: " + laser_module:GETFIELD("Hit").
	PRINT "Laser distance is measuring " + laser_module:GETFIELD("Distance") + " meters".
	WAIT 0.1.
}


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



PRINT "RALLENTATO".
LOCK WHEELTHROTTLE TO 0.2.
UNTIL DESTINATION:DISTANCE < 20 {
	PRINT DESTINATION:DISTANCE.
	PRINT "Laser is hitting: " + laser_module:GETFIELD("Hit").
	PRINT "Laser distance is measuring " + laser_module:GETFIELD("Distance") + " meters".
	WAIT 0.1.
}

PRINT "RALLENTATO".
//AG1 ON.
LOCK WHEELTHROTTLE TO 0.01.
UNTIL DESTINATION:DISTANCE < 5 {
	PRINT DESTINATION:DISTANCE.
	PRINT "Laser is hitting: " + laser_module:GETFIELD("Hit").
	PRINT "Laser distance is measuring " + laser_module:GETFIELD("Distance") + " meters".
	WAIT 0.1.
}

PRINT "ARRIVATO".
LOCK WHEELTHROTTLE TO 0.

BRAKES ON.
UNLOCK WHEELSTEERING.
UNLOCK WHEELTHROTTLE.