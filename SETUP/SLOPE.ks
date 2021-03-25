Clearscreen.

//until 0 {

//PRINT(addons:tr:impactpos).
//PRINT(ship:geoposition).
set impactCoord to addons:tr:impactpos.
//set impactCoord to ship:geoposition.
set impactPos to impactCoord:position.

//individuare i punti 
set body to ship:body.
set pointA to impactCoord.
set pointB to ship:body:geopositionof(impactPos + 2*Heading(0, 0):vector).
set pointc to ship:body:geopositionof(impactPos + 2*Heading(90, 0):vector).

//creare i vettori 
set northVector to pointB:position - pointA:position.
set eastVector to pointC:position - pointA:position.


//creare i lvettore uscente e confrontarli con UP
set upVector to vectorcrossproduct(northVector, eastVector).
//set uvdraw to vecdraw(impactPos, upVector, blue, "", 1.0, true).
print "SLOPE FACTOR = " + vectorangle(ship:up:vector, upVector).
//}
