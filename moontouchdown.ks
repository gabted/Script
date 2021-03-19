clearscreen.
print "Destroying Kinetic Energy".
lock steering to retrograde.
set thrust to 0.
lock throttle to thrust.
wait 5.
set Vo to 100.
until Vo < 2 {
	set thrust to 1.
	set vorbit to velocity:orbit.
	set Vox to vorbit:x.
	set Voy to vorbit:y.
	set Voz to vorbit:z.
	set Vo to ((Vox^2)+(Voy^2)+(Voz^2))^.5.
	}
set thrust to 0.
lock steering to up.
set max to 500.
set x to 0.
set GM to 6.5138398*(10^10).
clearscreen.
print "Decending" at (0,0).
wait 5.
set warp to 2. 
wait until alt:radar < 15000.
set warp to 0.
print "Radar Altitude" at (0,1).
until alt:radar < 10 {
	if alt:radar < 10000 AND x = 0 {
		set max to 250.
		set x to 1.
		}
	if alt:radar < 5000 AND x = 1 {
		set max to 100.
		set x to 2.
		}
	if alt:radar < 2500 AND x = 2 {
		set max to 50.
		set x to 3.
		}
	if alt:radar < 500 AND x = 3 {
		set max to 25.
		set x to 4.
		toggle AG3.
		print "Brace for Impact" at (0,1).
		}
	if alt:radar < 100 AND x = 4 {
		set max to 2.5.
		set x to 5.
		}
	set r to altitude+200000.
	set g to GM/(r)^2.
	set Vdown to (-1)*verticalspeed.
	set err to 1.	
	set error to err*(Vdown-max).
	if max > Vdown {
		set thrust to 0.
		}
	if max < Vdown {
		set thrust to error*((mass*g)/maxthrust).
		}
	print alt:radar at (20,3).
	if Vdown < 0 {
	break.
	}
	}
set thrust to .9*((mass*g)/maxthrust).
wait until verticalspeed > 0.
set thrust to 0.
lock steering to up.
wait 10.
clearscreen.
print "Touchdown!" at (0,0).
print "This ends Phase III, Next is Phase IV" at (0,1).
wait 3.