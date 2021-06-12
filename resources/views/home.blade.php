<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>UnikArt - Home</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="{{ url('css/home.css') }}">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico" />
</head>
<body>
 
    <nav>
      <div id="logo">
        <img src="images/Logo_square.png"> 
      </div>
      <div id="links">
        <a href="{{ url('home') }}">Home</a>
        <a href="{{ url('events') }}">Eventi</a>
        @if($isLogged)
          <a href="{{ url('explore') }}">Esplora</a>
          <a href="{{ url('logout') }}">Logout</a>
        @else 
          <a href="{{ url('login') }}">Accedi</a>
        @endif
        @if($isAdmin)
          <a href="{{ url('admin') }}">Admin</a>
        @endif
      </div>
    </nav>
    <img id="show-menu" src="images/list.svg">
    <script>
      function show(event){
        button.removeEventListener('click', show);
        button.src = "images/x-lg.svg";
        button.addEventListener('click', hide);
        document.querySelector('nav').style.position = "fixed";
        document.querySelector('nav').style.display = "block";
        document.querySelector('header').style.height = "500px";
      }
      function hide(event){
        button.removeEventListener('click', hide);
        button.src = "images/list.svg";
        button.addEventListener('click', show);
        button.style.position = "fixed";
        document.querySelector('nav').style.display = "none";
        document.querySelector('header').style.height = "300px";
      }
      const button = document.querySelector('#show-menu');
      button.addEventListener('click', show);
    </script>
    <header>
      <h1>Unik Art</h1>
      <p>Una trasformazione che celebra l'arte</p>
      <div class="overlay"></div>
    </header>
    <section>
      <div id="main">
        <img src="images/Logo_intero.png" >
         <p>
          Unik Art è un portale online di mostre digitali, per raccontare i grandi capolavori in una nuova chiave di lettura. <br>
          Sostiene il settore dei beni culturali nella sua trasformazione digitale per accogliere i cambiamenti del mondo digitale e incoraggiare collaborazioni che promuovano l'innovazione.
          La nostra esperienza ed originalità unite alla collaborazione con professionisti qualificati e creativi ci permettono di organizzare mostre puntando sulla valorizzazione del passato ma conservando sempre soluzioni efficienti e di impatto.
          Per raggiungere il nostro obiettivo sono necessari ingredienti semplici, ma sempre efficaci: l'esperienza, la competenza, la creatività, l’originalità e tanto entusiasmo.
        </p>
      </div>
      <div id="events-container">
        <h1>Prossimi Eventi</h1>

        @foreach($latestShows as $show)
        <div class="flex-item">
          <div class="img-container">
            <img src="{{ $show->cover }}">
          </div>
          <div class="info">
            <h1>{{ $show->title }}</h1>
            <p>{{ explode(" ", $show->date_and_time)[0] }}</p>
          </div>
        </div>
        @endforeach

    </section>
    <div id="load-more">
      <a href="{{ url('events') }}" class="button">Visualizza tutti</a>
    </div>

    <footer>
      <p>Alessio Marino O46002088</br>
        Università degli Studi di Catania 2021</p>
    </footer>
</body>
</html>