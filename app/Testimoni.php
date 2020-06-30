<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Testimoni extends Model
{
    protected $table = 'testimoni';
    protected $guarded = ['id'];

    public function cabang()
    {
    	return $this->belongsTo(Cabang::class);
    }
}
