//ACFEL
//ATMOSPHERIC CHECK FOR EXPERIMENTAL LIFTOFFS
//pitch_for original link-> https://github.com/KSP-KOS/KSLib/blob/master/library/lib_navball.ks

clearscreen.

PRINT "ACFEL - ATMOSPHERIC CHECK FOR EXPERIMENTAL LIFTOFFS".
PRINT "Flight Data from PISA".
//Functions Declaration

function pisa {
  print "ALT: " + ceiling(ship:altitude).
  print "AP: " + ceiling(apoapsis).
  print "ETA:AP " + ceiling(eta:apoapsis).
  print "PITCH: " + ceiling(pitch_for).
}


function pitch_for {
  parameter ves is ship,thing is "default".
  local pointing is ves:facing:forevector.
  if not thing:istype("string") {
    set pointing to type_to_vector(ves,thing).
  }

  return 90 - vang(ves:up:vector, pointing).
}


function record { 
  clearscreen.
  print "Recording Data at: " + TIME.
  print pisa.
  log ceiling(ship:altitude) to "alt.txt".
  log ceiling(apoapsis) to "ap.txt".
  log ceiling(eta:apoapsis) to "eta_ap.txt".
  log ceiling(pitch_for) to "pitch.txt".
  AG1 OFF.
}


//PROGRAM

UNTIL 0 { 
  if AG1 RECORD. 
  wait 0.1.
}

