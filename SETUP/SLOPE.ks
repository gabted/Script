UNTIL 0 {

Clearscreen.

set impactCoord to addons:tr:impactpos.
set impactCoord to ship:geoposition.
set impactPos to impactCoord:position.



//individuare i punti 
set body to ship:body.
set pointA to impactCoord.
set pointB to ship:body:geopositionof(impactPos + 2*Heading(0, 0):vector).
set pointc to ship:body:geopositionof(impactPos + 2*Heading(90, 0):vector).
print pointA.
print pointb.
print pointc.


//creare i vettori e disegnarli
set northVector to pointB:position - pointA:position.
set eastVector to pointC:position - pointA:position.
set nvdraw to vecdraw(impactPos, northVector, red, "", 1.0, true).
set evdraw to vecdraw(impactPos, eastVector, red, "", 1.0, true).


//creare i lvettore uscente e confrontarli con UP
set upVector to vectorcrossproduct(northVector, eastVector).
set uvdraw to vecdraw(impactPos, upVector, blue, "", 1.0, true).
print "SLOPE FACTOR = " + vectorangle(ship:up:vector, upVector) AT(1,10).


WAIT 0.1.
}