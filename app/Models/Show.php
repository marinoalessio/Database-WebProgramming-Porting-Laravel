<?php

use Illuminate\Database\Eloquent\Model;

class Show extends Model   
{
    public $timestamps = false;

    protected $fillable = [
        'title', 'date_and_time', 'duration', 'tags', 'cover', 'director_id', 'guide_id'
    ];

    public function director(){
        return $this->belongsTo(Director::class);
    }

    public function guide(){
        return $this->belongsTo(Guide::class);
    }

    public function users(){
        return $this->belongsToMany(User::class);
    }
    
}

?>