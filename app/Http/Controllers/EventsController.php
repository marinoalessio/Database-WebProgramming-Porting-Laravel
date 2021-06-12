<?php

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Http;
use Illuminate\Validation\Rule;
use App\Http\Middleware\Authenticate;

class EventsController extends BaseController
{
    public function events(){
        if(Authenticate::auth()) return view('events')
            ->with('isAdmin', Authenticate::auth() == env('ADMIN') ? true : false);
        else return redirect('login');
    }

    public function loadEvents($isChecked, $limit){ 

        $isChecked = filter_var($isChecked, FILTER_VALIDATE_BOOLEAN);
        if(!$isChecked){
            $response = Show::orderBy('date_and_time')->take($limit)->get();
        }else{
            $directorsIds = array();
            $directors = User::find(Session::get('user_id'))->directors()->get();
            for($i = 0; $i < count($directors); $i++) $directorsIds[] = $directors[$i]->id;
            $response = Show::whereIn('id', $directorsIds)->orderBy('date_and_time')->take($limit)->get();
        }

        $newJson = array();
        for ($i = 0; $i < count($response); $i++){

            if(time() > strtotime($response[$i]->date_and_time)) continue;
            $exists = User::find(Session::get('user_id'))->shows()->where('show_id', $response[$i]->id)->exists();

            $newJson[] = [
                'id' => $response[$i]->id, 'cover' => $response[$i]->cover, 'duration' => $response[$i]->duration,
                'title' => $response[$i]->title, 'date_and_time' => $response[$i]->date_and_time, 'highlighted' => $exists
            ];
        }
        return (Response::json($newJson));
    }

    public function eventDetails($id){
        if(!Authenticate::auth()) exit;

        $event = Show::find($id);
        $guide = $event->guide()->get()[0];
        $director = $event->director()->get()[0];

        return (Response::json([
            'title' => $event->title, 'date_and_time' => $event->date_and_time,
            'duration' => $event->duration, 'cover' => $event->cover,
            'dir_name' => $director->name, 'dir_surname' => $director->surname, 
            'dir_qualification' => $director->qualification, 'dir_img' => $director->img,
            'guide_name' => $guide->name, 'guide_surname' => $guide->surname, 
            'guide_qualification' => $guide->qualification, 'guide_img' => $guide->img 
        ]));
    }

    public function loadHighlights(){
        $highlights = User::find(Session::get('user_id'))->shows()->orderByDesc('since')->get();
        return Response::json($highlights);
    }

    public function addToHighlights($id){
        User::find(Session::get('user_id'))->shows()->attach($id);
    }

    public function removeFromHighlights($id){
        User::find(Session::get('user_id'))->shows()->detach($id);
    }

    public function loadAdvCategory(){
        $token = Http::asForm()->withHeaders([
            'Authorization' => 'Basic '.base64_encode(env('VIMEO_CLIENT_ID').':'.env('VIMEO_CLIENT_SECRET')),
        ])->post('https://api.vimeo.com/oauth/authorize/client', [
            'grant_type' => 'client_credentials',
            'Content-Type' => 'application/x-www-form-urlencoded',
            'Accept' => 'application/vnd.vimeo.*+json;version=3.4'
        ]);
        if ($token->failed()) abort(500);

        $response = Http::withHeaders([
            'Authorization' => 'Bearer '.$token['access_token']
        ])->get('https://api.vimeo.com/categories/art/videos');
        if($response->failed()) abort(500);

        $json = array();
        for ($i = 0; $i < 3; $i++) {
            $json[] = array('title' => $response['data'][$i]['name'], 'embed' => $response['data'][$i]['embed']['html']);
        }
        return $json;
    }

    public function loadAdv($query){
        $token = Http::asForm()->withHeaders([
            'Authorization' => 'Basic '.base64_encode(env('VIMEO_CLIENT_ID').':'.env('VIMEO_CLIENT_SECRET')),
        ])->post('https://api.vimeo.com/oauth/authorize/client', [
            'grant_type' => 'client_credentials',
            'Content-Type' => 'application/x-www-form-urlencoded',
            'Accept' => 'application/vnd.vimeo.*+json;version=3.4'
        ]);
        if ($token->failed()) abort(500);

        $response = Http::withHeaders([
            'Authorization' => 'Bearer '.$token['access_token']
        ])->get('https://api.vimeo.com/videos', ['query' => $query]);
        if($response->failed()) abort(500);

        $json = array();
        for ($i = 0; $i < 3; $i++) {
            $json[] = array('title' => $response['data'][$i]['name'], 'embed' => $response['data'][$i]['embed']['html']);
        }
        return $json;
    }

}

?>