<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Cookie;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Support\Facades\Session;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return route('login');
        }
    }

    public static function auth(){

        if(Session::get('user_id') == null) {
            
            if(Cookie::get('_user_id') != null && Cookie::get('_token') != null && Cookie::get('_cookie_id') != null){

                $cookie = CookieTable::where('id', Cookie::get('_cookie_id'))->where('user_id', Cookie::get('_user_id'))->first();
                if($cookie !== null){
                    if(time() > $cookie->expires){
                        $cookie->forceDelete();
                        return false;
                    } else if (Hash::check(Cookie::get('_token'), $cookie->$hash)){
                        Session::put('user_id', $cookie->user_id);
                        return Session::get('user_id');
                    }
                }

            }else return false;

        }else return Session::get('user_id');
    }

}
