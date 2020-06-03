//VA TESTATO LIVE, BIOGNA CAPIRE QUALE MOTORE è ATTIVO
LIST ENGINES in engList.
for eng in engList {
	if eng:ignition {
		print eng:name.
	}.
}.

LIST ENGINES in engList.
SET eng TO engList[0].
SET targetfile to "flightLog.txt".
function echo {
	parameter text.
	print(text).
}

function printStats {
	print("maxThrust = "+eng:maxThrust).
	print("Thrust = "+eng:Thrust).
	print("isp = "+eng:isp).
}

echo("Inizio testing").
printStats().

set thr to 1.
echo("Throttle a 1").
lock throttle to thr.
printStats.

until eng:thrust = eng:maxThrust {
	printStats.
}

echo("provo 6 valori di throttle").
FROM {set thr to 0.} UNTIL thr > 1 STEP {set thr to thr+0.2.} DO {
	wait(1).
	echo("Throttle =  "+thr).
	printStats.
}

set thr to 0.
wait(1).

unlock throttle.
