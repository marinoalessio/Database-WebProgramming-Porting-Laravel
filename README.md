# HW2
Porting del HW1 in Laravel

## Eventi
Mostra tutti gli eventi in programma per il futuro sulla sinistra oppure filtrandoli per numero o mostrando solo gli eventi organizzati dai Direttori Artistici seguiti, al centro l'evento di cui si vogliono visualizzare più informazioni, infine sulla destra una serie di video caricati tramite API con autenticazione OAuth2.0 ricercati tramite i tags impostati sugli eventi.

## Esplora
Mostra le informazioni dell'utente e i suoi ultimi posts. Al centro è possibile pubblicare un'opera d'arte, recensirla e attribuire una valutazione in stelle. Le opere vengono scelte tramite una API, aperta in visualizzazione modale; quando vengono recensite sono dinamicamente inserite nel database. La stessa sezione mostra le opere pubblicate da altri a cui poter aggiungere un like. 
Sulla destra l'insieme dei Direttori Artistici che organizzano gli eventi. Quest'ultimi possono essere seguiti e caricati in evidenza.

## Admin
Pagina accessibile solo dall'admin. Permette di inserire gli elementi del database quali nuovi Direttori Artistici, Guide ed Eventi.

## Login e Signup
Effettuano i normali controlli, come verifica di lunghezza della password e la presenza di minuscole, maiscole e numeri.
Gestiscono le sessioni e i cookies con l'interazione del database, riportato su hw2.sql

### Note
E' supportata la visualizzazione mobile.
