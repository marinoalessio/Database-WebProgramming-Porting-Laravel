<?php

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Support\Facades\Request;

class SignupController extends BaseController
{
    public function signup(){
        return view('signup')->with('csrf_token', csrf_token());
    }

    public function register(){
        $errors = array();
        $request = request();

        //username
        if(!preg_match('/^[A-Za-z0-9à-ù_\-\.]{1,15}$/', $request->username))
            $errors[] = "Username non valido";
        else if (User::where('username', $request->username)->exists())
            $errors[] = "Username non disponibile";

        // email
        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
            $errors[] = "Email non valida";
        else if (User::where('email', $request->email)->exists())
            $error[] = "Email già utilizzata";
        
        //password
        if(!preg_match('/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}$/', $request->password))
            $errors[] = "Caratteri password insufficienti";
        
        //confirm password
        if (strcmp($request->password, $request->confirm_password) != 0)
            $errors[] = "Le password non coincidono";
        
        //if everything is ok, proceed
        if (count($errors) == 0) {
            $newUser = User::Create([
                'username' => $request->username,
                'password' => bcrypt($request->password),
                'name' => $request->name,
                'surname' => $request->surname,
                'email' => $request->email,
                'avatar' => 'storage/avatar/'.$request->avatar.'.png',
            ]);
            if($newUser){
                Session::put('user_id', $newUser->id);
                return redirect('home');
            }else $errors[] = "Errore durante il caricamento";
        }
        return redirect('signup')->withInput()->withErrors(['errors' => implode(", \n", $errors)]);
    }

    public function checkUsername($q){
        $exist = User::where('username', $q)->exists();
        return Response::json(['exists' => $exist]);
    }

    public function checkEmail($q){
        $exist = User::where('email', $q)->exists();
        return Response::json(['exists' => $exist]);
    }
}

?>