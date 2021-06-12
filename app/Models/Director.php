<?php

use Illuminate\Database\Eloquent\Model;

class Director extends Model   
{
    public $timestamps = false;

    protected $fillable = [
        'cf', 'name', 'surname', 'qualification', 'img'
    ];

    public function shows(){
        return $this->hasMany(Show::class);
    }

    public function users(){
        return $this->belongsToMany(User::class);
    }
}

?>