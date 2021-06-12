<?php

use Illuminate\Database\Eloquent\Model;

class Guide extends Model   
{
    public $timestamps = false;

    protected $fillable = [
        'cf', 'name', 'surname', 'qualification', 'img'
    ];

    public function shows(){
        return $this->hasMany(Show::class);
    }
}

?>