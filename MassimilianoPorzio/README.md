# Punteggio

-   UI/UX: 7.5/10
-   Struttura progetto: 8.5/10
-   Pulizia del codice: 8/10
-   Ottimizzazione del codice: 9/10
-   https://github.com/massimilianoporzio/job_app

# Osservazioni

-   UI molto carina in alcuni suoi punti, c'è stato un grande lavoro su piccole animazioni di cui sono un fan
-   UX un po macchinosa dal punto di vista di un utente che deve usarla quotidianamente
-   La pagina di splash con il caricamento carica per 3 secondi fissi, ma non fa niente in background. Dopo di che la pagina di home carica nuovamente per mostrare i dati, l'ho trovato poco intuitiva come cosa ed inoltre l'app è usabile solo dopo 5 secondi dall'apertura.
-   Alcune illustrazioni sono troppo grandi, con testo sovrapposto ed hanno un background bianco quindi in dark mode non funzionano
-   La schermata di home (almeno da iOS) lancia eccezioni quando si cerca di scrollarla
-   Bella l'implementazione dei filtri
-   I colori dell'app sono un mix di scala di grigi, gradients basati sul blu e poi altri colori come il verde, sarebbe stato meglio definire bene un design system
-   E poco intuitiva l'apertura dei dettagli di un annuncio, al posto della singola icona avrei messo cliccabile tutto il box (bella comunque la transizione)
-   Ottimo il fatto che la pagina dei dettagli di un annuncio mostri i dati con una grafica Notion, riprende la UI del sito internet e da continuità sotto il punto di vista della UX
-   Ben fatta l'implementazione per la mancanza di connessione internet (tra le migliori)
-   La struttura del progetto è abbastanza semplice, e si vede che c'è un lavoro di organizzazione, ma mancano ancora alcuni importanti refactoring per rendere il codice più leggibile e semplice.

# Funzionalità usate

-   Cubit
-   Audio player
-   Pagination
-   Variabili d'ambiente
-   Stili negli annunci preservati
-   Uso di spinner per loading (non ideale, shimmer sarebbe stato meglio)
-   Dark mode
-   Struttura del progetto
-   Gestione errori
-   Alcuni elementi di programmazione funzionale
-   Funzionalità sharing
-   Gestione connessione internet

# Screenshots

![Screenshots](./screenshot.jpg)
