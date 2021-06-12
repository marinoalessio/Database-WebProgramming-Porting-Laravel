<?php

use Illuminate\Database\Eloquent\Model;

class Artwork extends Model   
{
    public $timestamps = false;
    protected $autoIncrement = false;

    protected $fillable = [
        'id', 'title', 'artists', 'img', 'publication_year', 'place_of_origin', 'description', 'category'
    ];

    public function reviews(){
        return $this->hasMany(Review::class);
    }
}

?>