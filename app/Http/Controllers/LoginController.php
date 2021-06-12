<?php

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Database\Eloquent\Model;
use App\Http\Middleware\Authenticate;

class LoginController extends BaseController
{
    public function login(){
        if(Authenticate::auth()){
            return redirect('home');
        }else{
            return view('login')
                ->with('csrf_token', csrf_token())
                ->with('old_username', Request::old('username'))
                ->with('old_password', Request::old('password'));
        }
    }

    public function checkLogin(){
        $user = User::where('username', request('username'))->orWhere('email', request('username'))->first();
        if(isset($user) && Hash::check(request('password'), $user->password)){

            if(request('remember')){
                $token = random_bytes(12);
                $hash = Hash::make($token);
                $expiration = strtotime("+1 week");
                CookieTable::create([
                    'user_id' => $user->id,
                    'hash' => $hash,
                    'expires' => $expiration,
                ]);
                Cookie::queue('_user_id', $user->id, $expiration);
                Cookie::queue('_cookie_id', CookieTable::where('user_id', $user->id)->first()->id, $expiration);
                Cookie::queue('_token', $token, $expiration);
            }

            Session::put('user_id', $user->id);
            return redirect('home');
        }else{
            return redirect('login')->withInput(); 
        }
    }

    public function logout(){
        if(Cookie::get('_cookie_id') != null){
            CookieTable::where('id', Cookie::get('_cookie_id'))->first()->forceDelete();
            Cookie::queue(Cookie::forget('_user_id'));
            Cookie::queue(Cookie::forget('_cookie_id'));
            Cookie::queue(Cookie::forget('_token'));
        }
        Session::flush();
        return redirect('login');
    }
}

?>
