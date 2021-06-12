<?php

use Illuminate\Database\Eloquent\Model;

class Review extends Model   
{
    protected $fillable = [
        'artwork_id', 'user_id', 'stars', 'body'
    ];

    public function artwork(){
        return $this->belongsTo(Artwork::class);
    }
    
    public function user(){
        return $this->belongsTo(User::class);
    }

    public function likes(){
        return $this->belongsToMany(User::class);
    }

    public function getTimeAttribute(){
        return $this->created_at->diffForHumans(null, false, false);
    }
}

?>