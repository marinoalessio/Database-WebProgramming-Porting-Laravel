<?php

use Illuminate\Database\Eloquent\Model;

class User extends Model   
{
    protected $hidden = ['password'];
    public $timestamps = false;

    protected $fillable = [
        'name', 'surname', 'username', 'email', 'password', 'confirm_password', 'avatar'
    ];

    public function shows(){
        return $this->belongsToMany(Show::class);
    }

    public function reviews(){
        return $this->hasMany(Review::class);
    }

    public function likes(){
        return $this->belongsToMany(Review::class);
    }

    public function directors(){
        return $this->belongsToMany(Director::class);
    }

    public function cookie(){
        return $this->hasOne(CookieTable::class);
    }

}

?>