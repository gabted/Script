//SET destCoord TO LATLNG(-0.0485997, -74.724375).	ksc
SET destCoord TO LATLNG(-1.5409,-71.9099).	//island airport

UNTIL 0{
	SET impactCoord to addons:tr:impactpos.
	SET distance to destCoord:position - impactCoord:position.
	//PRINT(ABS(distance:MAG)).
	print "posizione: "+ship:geoposition.
	print "destinazione: "+destCoord.
	print "impatto: "+impactCoord.
	print "Sei "+(impactCoord:Lat - destCoord:Lat)+" gradi troppo a nord".
	print "Sei "+(impactCoord:LNG - destCoord:LNG)+" gradi troppo a est".
	print "Distanza: "+distance:mag+" m".
	print " ".
	WAIT 0.5.
}