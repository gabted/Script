ClearScreen.

//raccolgo i dati della manovra
List Engines in engList.
Set eng To engList[0].
Set n to nextNode.
Set Dv to n:DeltaV:mag.

//ricavo le caratteristiche del razzo
Set m to ship:mass.
Set cVel to eng:ISP*g0. //C è la velocità del gas emesso, relativamente alla nave
Set qRate to eng:AvailableThrust/C // thrust è definito come qC, dove q è quanta massa viene emessa al secondo

//equazione del razzo di Ciolkovsky: Dv = C*ln(mi/mf), con mi e mf massa iniziale e finale
//noi sappiamo Dv e non sappiamo mf, e mf = mi - qt, cioè la massa rimanente dopo che ho sparato per t secondi
//quindi da Dv possiamo ricavarci t, cioè il burntime
//t = m/q(1-e^(-dv/2)), che riorganizzato per ragioni di stabilità diventa
Set burnTime to m/qRate - m/(qRate*e^(Dv/cVel)).
print(Burntime).