Clearscreen.

set impactCoord = addons:tr:impactpos.
set impactPos = impactCoord:position.

set pointA = impactPos.
set pointB = impactPos + V(1, 0, 0).
set pointC = impactPos + V(0, 0, 1).

print impactCoord.
print impactPos:mag.