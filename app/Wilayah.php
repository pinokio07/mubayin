<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wilayah extends Model
{
    protected $table = 'wilayah';
    protected $guarded = ['id'];

    public function cabang()
    {
    	return $this->hasMany(Cabang::class);
    }
}
