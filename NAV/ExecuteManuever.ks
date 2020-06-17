ClearScreen.

//raccolgo i dati della manovra
List Engines in engList.
Set eng To engList[0].
Set n to nextNode.
Set Dv to n:DeltaV:mag.

//ricavo le caratteristiche del razzo
Set m to ship:mass.
Set cVel to eng:ISP*constant:g0. //C è la velocità del gas emesso, relativamente alla nave
Set qRate to eng:AvailableThrust/Cvel. // thrust è definito come qC, dove q è quanta massa viene emessa al secondo

//equazione del razzo di Ciolkovsky: Dv = C*ln(mi/mf), con mi e mf massa iniziale e finale
//noi sappiamo Dv e non sappiamo mf, e mf = mi - qt, cioè la massa rimanente dopo che ho sparato per t secondi
//quindi da Dv possiamo ricavarci t, cioè il burntime
//t = m/q(1-e^(-dv/2)), che riorganizzato per ragioni di stabilità diventa
set burnTIME to m/qRate - m/(qRate*e^(Dv/cVel)).

//volendo che il burntime sia diviso in due periodi, uno iniziale, uno finale, entrambi che comportino Dv/2 ciascuno
//ricavo il tempo necessario per spingere i primi Dv/2, e calcolo in che momento devo 
//comincio a spingere prima di raggiongere il nodo, in modo tale da spingere Dv/2 prima del nodo e Dv/2 dopo
Set HalfBurnTime to (m/qRate) - m/(qRate*e^(Dv/2*Cvel)).

//ESECUZIONE NODO
//##############################
//POSIZIONAMENTO
Print("POSIZIONAMENTO").
Sas on.
Set sasmode to "Manuever".
Wait(5).

//INIZIO BURN
Wait until n:eta <= (HalfBurnTime).
set tset to 0.
lock throttle to tset.
Set tset to 1.
Wait(Burntime).
Set tset to 0.
Unlock throttle.