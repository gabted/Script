//LASER FRONTALE Y-BEND 3.5
SET laser_module TO SHIP:MODULESNAMED("LaserDistModule")[0].
IF not laser_module:GETFIELD("Enabled") {
  laser_module:SETFIELD("Enabled",true).
}.

until 0 {
	PRINT "Laser is hitting: " + laser_module:GETFIELD("Hit").
	PRINT "Laser distance is measuring " + laser_module:GETFIELD("Distance") + " meters".
	WAIT 0.1.
}