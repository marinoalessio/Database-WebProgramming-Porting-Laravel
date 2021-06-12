<?php

use Illuminate\Routing\Controller as BaseController;
use App\Http\Middleware\Authenticate;
use Illuminate\Database\Eloquent\Model;

class HomeController extends BaseController
{
    public function home(){
        return view('home')
            ->with('latestShows', Show::orderBy('date_and_time')->take(4)->get())
            ->with('isLogged', Authenticate::auth() != null ? true : false)
            ->with('isAdmin', Authenticate::auth() == env('ADMIN') ? true : false);
    }

}

?>