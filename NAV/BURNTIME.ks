// PRESUDOCODICE
// NON ESEGUIBILE
//per altro scritto stile java quindi col cacchio che kos lo esegue

FUN BURNTIME(NODE N){
	//raccolgo i dati della manovra
	Dv = n.getDeltaV
	eta = n.eta
	
	//ricavo le caratteristiche del razzo
	C = engine.Isp * g0 //C è la velocità del gas emesso, relativamente alla nave
	q = engine.availablethrust/C // thrust è definito come qC, dove q è quanta massa viene emessa al secondo
	m = ship.mass
	
	//equazione del razzo di Ciolkovsky: Dv = C*ln(mi/mf), con mi e mf massa iniziale e finale
	//noi sappiamo Dv e non sappiamo mf, e mf = mi - qt, cioè la massa rimanente dopo che ho sparato per t secondi
	//quindi da Dv possiamo ricavarci t, cioè il burntime
	//t = m/q(1-e^(-dv/2)), che riorganizzato per ragioni di stabilità diventa
	burntime = m/q - m/(q*e^(Dv/c))
	
	//volendo che il burntime sia diviso in due periodi, uno iniziale, uno finale, entrambi che comportino Dv/2 ciascuno
	//ricavo il tempo necessario per spingere i primi Dv/s, e calcolo in che momento devo 
	//comincio a spingere FirstBurntime prima di raggiongere il nodo, in modo tale da spingere Dv/2 prima del nodo e Dv/2 dopo
	t0 = (eta - m/q) - m/(q*e^(Dv/2*C))
	
	return t0, burntime
	
	//un ulteriore miglioramento potrebbe essere tenere conto del tempo di accensione e spegnimento del motore, e quindi dividere il Dv in 4:
	//prima parte, motore che aumenta verso full throttle, spero pochi secondi
	//seconda parte, full throttle fino a raggiungere il nodo
	//terza parte, full throttle fin quasi a concludere la Dv
	//quarta parte, da full Throttle a zero
	//prima + seconda = Dv/2 = terza + quarta
}