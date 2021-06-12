<?php

use Illuminate\Support\Facades\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use App\Http\Middleware\Authenticate;

class AdminController extends BaseController
{
    public function admin(){
        if(Authenticate::auth() == env('ADMIN')) return view('admin')
        ->with('csrf_token', csrf_token())
        ->with('guides', Guide::all())
        ->with('directors', Director::all());
        else return redirect('login');
    }

    public function uploadGuide(){

        $request = request()->all();
        $response = array();
        if(
            isset($request['guide_cf']) && Guide::where('cf', $request['guide_cf'])->first() == null &&
            isset($request['guide_name']) && isset($request['guide_surname']) &&
            isset($request['guide_qualification']) && request()->has('file_guide')
        ){
            $file = request()->file('file_guide');
            $fileError = false;
            if(!$file->isValid()){
                $fileError = true; 
                $response[] = 'Il file è corrotto';
            }
            if($file->getSize() > 5000000){ 
                $fileError = true; 
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!in_array($file->extension(), array('jpg', 'png', 'jpeg', 'gif'))){
                $fileError = true;
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!$fileError){
                $storePath = Storage::put('public/propic', $file);
                Guide::create([
                    'cf' => $request['guide_cf'],
                    'name' => $request['guide_name'],
                    'surname' => $request['guide_surname'],
                    'qualification' => $request['guide_qualification'],
                    'img' => 'storage/propic/' . basename($storePath)
                ]);
                $response[] = 'Guida caricata correttamente';
            }
        }else{
            $response[] = 'Errore nel caricamento, controlla tutti i campi';
        }
        $response = implode('\n', $response);
        return view('admin')->with('response', $response)->with('csrf_token', csrf_token())
        ->with('guides', Guide::all())->with('directors', Director::all());
    }

    public function uploadDirector(){

        $request = request()->all();
        $response = array();
        if(
            isset($request['dir_cf']) && Director::where('cf', $request['dir_cf'])->first() == null &&
            isset($request['dir_name']) && isset($request['dir_surname']) &&
            isset($request['dir_qualification']) && request()->has('file_dir')
        ){
            $file = request()->file('file_dir');
            $fileError = false;
            if(!$file->isValid()){
                $fileError = true; 
                $response[] = 'Il file è corrotto';
            }
            if($file->getSize() > 5000000){ 
                $fileError = true; 
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!in_array($file->extension(), array('jpg', 'png', 'jpeg', 'gif'))){
                $fileError = true;
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!$fileError){
                $storePath = Storage::put('public/propic', $file);
                Director::create([
                    'cf' => $request['dir_cf'],
                    'name' => $request['dir_name'],
                    'surname' => $request['dir_surname'],
                    'qualification' => $request['dir_qualification'],
                    'img' => 'storage/propic/' . basename($storePath)
                ]);
                $response[] = 'Direttore Artistico caricato correttamente';
            }
        }else{
            $response[] = 'Errore nel caricamento, controlla tutti i campi';
        }
        $response = implode('\n', $response);
        return view('admin')->with('response', $response)->with('csrf_token', csrf_token())
        ->with('guides', Guide::all())->with('directors', Director::all());
    }

    public function uploadEvent(){

        $request = request()->all();
        $response = array();
        if(
            isset($request['title']) && isset($request['date-and-time']) && 
            Show::where('title', $request['title'])->where('date_and_time', $request['date-and-time'])->first() == null &&
            isset($request['time']) && isset($request['dir_choice']) && isset($request['guide_choice']) && request()->has('event_cover')
        ){
            $file = request()->file('event_cover');
            $fileError = false;
            if(!$file->isValid()){
                $fileError = true; 
                $response[] = 'Il file è corrotto';
            }
            if($file->getSize() > 5000000){ 
                $fileError = true; 
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!in_array($file->extension(), array('jpg', 'png', 'jpeg', 'gif'))){
                $fileError = true;
                $response[] = 'Il file supera le dimensioni di 5MB';
            }
            if(!$fileError){
                $storePath = Storage::put('public/cover', $file);

                $date_and_time = $request['date-and-time'];
                $date_and_time = explode('T', $date_and_time);
                $date_and_time = implode(" ", $date_and_time) . ":00";

                $duration = $request['time'];
                $duration = explode(":", $duration);
                $duration = (int)$duration[0]*60 + (int)$duration[1];

                Show::create([
                    'title' => $request['title'],
                    'date_and_time' => $date_and_time,
                    'duration' => $duration,
                    'tags' => $request['tags'],
                    'cover' => 'storage/cover/' . basename($storePath),
                    'director_id' => $request['dir_choice'],
                    'guide_id' => $request['guide_choice']
                ]);
                $response[] = 'Evento caricato correttamente';
            }
        }else{
            $response[] = 'Errore nel caricamento, controlla tutti i campi';
        }
        $response = implode('\n', $response);
        return view('admin')->with('response', $response)->with('csrf_token', csrf_token())
        ->with('guides', Guide::all())->with('directors', Director::all());
    }
}

?>