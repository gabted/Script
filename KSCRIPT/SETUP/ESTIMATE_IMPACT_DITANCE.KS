SET destCoord TO LATLNG(-0.0485997, -74.724375).

UNTIL 0{
	SET impactCoord to addons:tr:impactpos.
	SET distance to destCoord:position - impactCoord:position.
	PRINT(ABS(distance:MAG)).

	WAIT 0.5.
}