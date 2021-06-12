<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title>UnikArt - Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{ url('css/admin.css') }}">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
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
        <a href="{{ url('explore') }}">Esplora</a>
        <a href="{{ url('logout') }}">Logout</a>
        <a href="{{ url('admin') }}">Admin</a>
    </div>
</nav>
<div id="nav-back"></div>

<main>
    @if(isset($response))
        <div class="response">{{ $response }}</div>
    @endif
    <div id="director">
        <h1>Inserisci Direttore Artistico</h1>
        <form name='director' method='post' enctype="multipart/form-data" autocomplete="off" action="{{ route('director') }}">
            <input type='hidden' name='_token' value='{{ $csrf_token }}'>
            <div class="cf">
                <label for="cf">Codice Fiscale</label>  
                <input type='text' name='dir_cf'>
            </div>
            <div class="name">
                <label for="name">Nome</label>  
                <input type='text' name='dir_name'>
            </div>
            <div class="surname">
                <label for="surname">Cognome</label>
                <input type='text' name='dir_surname'>
            </div>
            <div class="qualification">
                <label for="qualification">Titolo di studio</label>
                <input type='text' name='dir_qualification'>
            </div>

            <div class="fileupload">
                <label for='propic'>Immagine profilo</label>
                <input type="file" name="file_dir" id="file_dir">
            </div>

            <div class="submit">
                <input type='submit' value="Carica">
            </div>

        </form>
    </div>

    <div id="guides">
    <h1>Inserisci Guida</h1>
        <form name='guide' method='post' enctype="multipart/form-data" autocomplete="off" action="{{ route('guide') }}">
        <input type='hidden' name='_token' value='{{ $csrf_token }}'>
            <div class="cf">
                <label for="cf">Codice Fiscale</label>  
                <input type='text' name='guide_cf'>
            </div>
            <div class="name">
                <label for="name">Nome</label>  
                <input type='text' name='guide_name'>
            </div>
            <div class="surname">
                <label for="surname">Cognome</label>
                <input type='text' name='guide_surname'>
            </div>
            <div class="qualification">
                <label for="qualification">Titolo di studio</label>
                <input type='text' name='guide_qualification'>
            </div>

            <div class="fileupload">
                <label for='propic'>Immagine profilo</label>
                <input type="file" name="file_guide" id="file_guide">
            </div>

            <div class="submit">
                <input type='submit' name="submit" value="Carica">
            </div>

        </form>
    </div>
    <div id="events">
        <h3>Carica Evento</h3>
        <form name='event' method='post' enctype="multipart/form-data" autocomplete="off" action="{{ route('event') }}">
        <input type='hidden' name='_token' value='{{ $csrf_token }}'>
            <div class="left">
                <div class="title">
                    <label for='title'>Titolo</label>
                    <input type="text" name="title">
                </div>
                <div class="date-and-time">
                    <label for="date-and-time">Data e ora</label>
                    <input type="datetime-local" name="date-and-time"
                    min="2021-05-25T00:00" max="2030-12-31T23:59">
                </div>
                <div class="duration">
                    <label for="duration">Durata</label>
                    <input type="time" name="time" required>
                </div>
                <div class="fileupload">
                    <label for='event-cover'>Copertina evento</label>
                    <input type="file" name="event_cover">
                </div>
                <div class="tags">
                    <div><label for='tags'>Tags</label></div>
                    <textarea name="tags" placeholder="Digital Art, Romanticismo, Architettura..." 
                    cols="50" rows="5" maxlength="750"></textarea>
                </div>
            </div>

            <div class="right">
                <div><label for='director'>Direttore Artistico</label></div>
                <div class="director">
                    <div class="select">
                        <select class="choice" name="dir_choice">
                            <option value="none" selected hidden></option>
                            @foreach ($directors as $director)
                            <option value="{{ $director->id }}">{{ $director->name.' '.$director->surname }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div><label for='guide'>Guida</label></div>
                <div class="guide">
                    <div class="select">
                        <select class="choice" name="guide_choice">
                            <option value="none" selected hidden></option>
                            @foreach ($guides as $guide)
                            <option value="{{ $guide->id }}">{{ $guide->name.' '.$guide->surname }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                
                <div class="submit">
                    <input type='submit' name="submit" value="Carica">
                </div>
            </div>

        </form>
    </div>

</main>
</body>

</html>