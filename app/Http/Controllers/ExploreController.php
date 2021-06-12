<?php

use Illuminate\Routing\Controller as BaseController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;
use App\Http\Middleware\Authenticate;

class ExploreController extends BaseController
{
    public function explore(){
        if(Authenticate::auth()){
            $user = User::find(session('user_id'));
            return view('explore')
            ->with('isAdmin', Authenticate::auth() == env('ADMIN') ? true : false)
            ->with('user', $user)
            ->with('csrf_token', csrf_token());
        }else{
            return redirect('login');
        }
    }

    public function profileInfo(){
        $user = User::find(Session::get('user_id'));
        return ['nfollowing'=> $user->nfollowing, 'nreviews'=> $user->nreviews];
    }

    public function loadUserReview(){
       
        $reviews = Review::orderBy('created_at', 'DESC')->where('user_id', Session::get('user_id'))->get();
        $response = array();

        for ($i = 0; $i < count($reviews); $i++){
            
            $user = $reviews[$i]->user()->first();
            $artwork = $reviews[$i]->artwork()->first();
            $like = $reviews[$i]->likes()->where('user_id', Session::get('user_id'))->exists();

            $response[] = [
                'title' => $artwork->title, 'artists' => $artwork->artists,
                'img' => $artwork->img, 'publication_year' => $artwork->publication_year,
                'place_of_origin' => $artwork->place_of_origin, 'description' => $artwork->description,
                'category' => $artwork->category, 'name' => $user->name, 'surname' => $user->surname,
                'avatar' => $user->avatar, 'username' => $user->username, 'review_id' => $reviews[$i]->id,
                'stars' => $reviews[$i]->stars, 'body' => $reviews[$i]->body, 'likes' => $reviews[$i]->n_likes,
                'publication_date' => $reviews[$i]->getTimeAttribute(), 'is_liked' => $like
            ];
        }
        return Response::json($response);
    } 

    public function loadOthersReview(){
        $reviews = Review::orderBy('created_at', 'DESC')->where('user_id', '!=', Session::get('user_id'))->get();
        
        $response = array();
        for ($i = 0; $i < count($reviews); $i++){
            
            $user = $reviews[$i]->user()->first();
            $artwork = $reviews[$i]->artwork()->first();
            $like = $reviews[$i]->likes()->where('user_id', Session::get('user_id'))->exists();

            $response[] = [
                'title' => $artwork->title, 'artists' => $artwork->artists,
                'img' => $artwork->img, 'publication_year' => $artwork->publication_year,
                'place_of_origin' => $artwork->place_of_origin, 'description' => $artwork->description,
                'category' => $artwork->category, 'name' => $user->name, 'surname' => $user->surname,
                'avatar' => $user->avatar, 'username' => $user->username, 'review_id' => $reviews[$i]->id,
                'stars' => $reviews[$i]->stars, 'body' => $reviews[$i]->body, 'likes' => $reviews[$i]->n_likes,
                'publication_date' => $reviews[$i]->getTimeAttribute(), 'is_liked' => $like
            ];
        }
        return Response::json($response);
    }

    public function like($review_id){
        User::find(Session::get('user_id'))->likes()->attach($review_id);
        return Response::json(Review::find($review_id)->n_likes);
    }

    public function unlike($review_id){
        User::find(Session::get('user_id'))->likes()->detach($review_id);
        return Response::json(Review::find($review_id)->n_likes);
    }

    public function fetchArtworks($q){
        $image_endpoint = 'https://www.artic.edu/iiif/2/';
        $url = 'https://api.artic.edu/api/v1/artworks/search?q='.$q.'&limit=8&fields=id,title,image_id';
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($ch);
        $json = json_decode($data, true);
        curl_close($ch);

        $newJson = array();
        for ($i = 0; $i < count($json['data']); $i++) {
            $newJson[] = array('id' => $json['data'][$i]['id'], 'title' => $json['data'][$i]['title'], 
            'image_id' => $image_endpoint . $json['data'][$i]['image_id'] . '/full/843,/0/default.jpg');
        }
        return Response::json($newJson);
    }

    public function postReview(){
        $request = request();
        if(Review::where('artwork_id', $request->artwork_id)->where('user_id', Session::get('user_id'))->first() == null){

            $url = 'https://api.artic.edu/api/v1/artworks/'.$request->artwork_id;
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $data = curl_exec($ch);
            $json = json_decode($data, true)['data'];
            curl_close($ch);

            //create review if does not exists yet
            if(Artwork::where('id', $request->artwork_id)->first() == null){
                $newArtwork = Artwork::create([
                    'id' => $request->artwork_id,
                    'title' => $json['title'],
                    'artists' => $json['artist_display'],
                    'img' => $request->img,
                    'publication_year' => $json['date_end'],
                    'place_of_origin' => $json['place_of_origin'],
                    'description' => $json['thumbnail']['alt_text'],
                    'category' => $json['department_title'],
                ]);
            }

            $newReview = Review::create([
                'artwork_id' => $request->artwork_id,
                'user_id' => Session::get('user_id'),
                'stars' => $request->stars,
                'body' => $request->comment,
            ]);
            if($newReview) return Response::json(['ok' => true]);
            else return Response::json(['ok' => true, 'error' => 'Qualcosa è andato storto']);

        }else{
            return Response::json(['ok' => false, 'error' => 'Hai già caricato questa recensione']);
        }
    }
    
    public function loadFollowings(){
        $directors = Director::all();
        $response = array();
        for ($i = 0; $i < count($directors); $i++){
            $is_following = Director::find($directors[$i]->id)->users()->where('id', Session::get('user_id'))->exists();
            $response[] = [
                'id' => $directors[$i]->id, 'name' => $directors[$i]->name, 'surname' => $directors[$i]->surname, 
                'qualification' => $directors[$i]->qualification, 'img' => $directors[$i]->img,
                'is_following' => $is_following
            ];
        }
        return Response::json($response);
    }

    public function followDirector($id){
        Director::find($id)->users()->attach(Session::get('user_id'));
    }

    public function unfollowDirector($id){
        Director::find($id)->users()->detach(Session::get('user_id'));
    }
}

?>