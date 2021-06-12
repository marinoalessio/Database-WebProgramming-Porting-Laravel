<?php

use Illuminate\Database\Eloquent\Model;

class CookieTable extends Model   
{
    public $timestamps = false;
    protected $table = "cookies";

    protected $fillable = [
        'hash', 'user_id', 'expires'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function auth(){
        return 1;
    }
}

?>