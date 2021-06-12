<html>
<head>
    <link rel='stylesheet' href="{{ url('css/signup.css') }}">
    <script src="{{ url('scripts/signup.js') }}" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/favicon.ico">
    <meta charset="utf-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <title>Iscriviti</title>
</head>

<body>
    <section class="register">
        <h1>Siamo felici di averti con noi</h1>
        @if(session('errors') != null)
        <p class="error">{{session('errors')->first('errors')}}</p>
        @endif
        
        <form name='signup' method='post' enctype="multipart/form-data" autocomplete="off" action="{{ route('signup') }}">
        <input type='hidden' name='_token' value='{{ $csrf_token }}'>
            <div class="names">
                <div class="name">
                    <div><label for='name'>Nome</label></div>
                    <div>
                        <input type='text' name='name' value="{{ old('name') }}">
                        <p class="hidden">Nome non valido</p>
                    </div>
                    
                </div>
                <div class="surname">
                    <div><label for='surname'>Cognome</label></div>
                    <div><input type='text' name='surname' value="{{ old('surname') }}">
                        <p class="hidden">Cognome non valido</p>
                    </div>
                </div>
            </div>
            <div class="username">
                <div><label for='username'>Username</label></div>
                <div>
                    <input type='text' name='username' value="{{ old('username') }}">
                    <p class="hidden"></p>
                </div>
            </div>
            <div class="email">
                <div><label for='email'>Email</label></div>
                <div>
                    <input type='text' name='email' value="{{ old('mail') }}">
                    <p class="hidden"></p>
                </div>
            </div>
            <div class="password">
                <div><label for='password'>Password</label></div>
                <div>
                    <input type='password' name='password' value="{{ old('password') }}">
                    <p class="hidden"></p>
                </div>
                
            </div>
            <div class="confirm_password">
                <div><label for='confirm_password'>Conferma Password</label></div>
                <div>
                    <input type='password' name='confirm_password' value="{{ old('confirm_password') }}">
                    <p class="hidden"></p>
                </div>
            </div>
            <div class="avatar">
                <label for="avatar">Scegli il tuo avatar:</label>
                <select name="avatar" value="{{ old('name') }}">
                    <option value="none" selected hidden></option>
                    <option value="frida">Frida</option>
                    <option value="picasso">Picasso</option>
                    <option value="leonardo">Leonardo</option>
                    <option value="vangogh">Van Gogh</option>
                    <option value="dali">Dalì</option>
                </select>
            </div>
            <div class="allow">
                <span><input type='checkbox' name='allow' value="1" value="{{ old('name') }}"></span>
                <span><label for='allow'>Ho letto e accetto i Termini di Servizio</label></span>
            </div>
            <div class="submit">
                <input type='submit' value="Registrati" id="submit" >
            </div>
        </form>
        <span class="login">Hai gia un account? <a href="{{ url('login') }}">Accedi</a></span>
    </section>
</body>

</html>