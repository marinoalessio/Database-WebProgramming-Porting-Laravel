<html>
    <head>
        <link rel='stylesheet' href='{{ url("css/login.css") }}'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="images/favicon.ico">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
        <title>UnikArt - Login</title>
    </head>
    <body>
        <div id="container">

            <div class="main-left">
                <h1>Benvenuto</h1>
                <p>Entra nella Community di appassionati d'arte per non perderti i nostri eventi</p>
            </div>

            <div class="main-right">
                <img src="images/Logo_intero.png" >

                @if(isset($old_username) && isset($old_password))
                <span class='error'>Username/email o password errati</span>
                @elseif(isset($old_username) || isset($old_password))
                <span class='error'>Inserire entrambi i campi</span>
                @endif
                <form name='login' method='post'>

                    <input type='hidden' name='_token' value='{{ $csrf_token }}'>
                    <div class="username">
                        <div><label for='username'>Nome utente o email</label></div>
                        <div><input type='text' name='username' value="{{ $old_username }}"></div>
                    </div>
                    <div class="password">
                        <div><label for='password'>Password</label></div>
                        <div><input type='password' name='password' value="{{ $old_password }}"></div>
                    </div>
                    <div class="remember">
                        <span><input type='checkbox' name='remember' value="1"></span>
                        <span><label for='remember'>Ricorda l'accesso</label></span>
                    </div>

                    <div class="submit">
                        <input type='submit' value="Accedi">
                    </div>
                </form>
                <div class="register">
                    <span>Non hai un account? </span><span><a href="{{ url('signup') }}">Registrati</a></span>
                </div>
            </div>

        </div>
    </body>
</html>