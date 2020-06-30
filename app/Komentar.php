<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Komentar extends Model
{
    protected $table = 'komentar';
    protected $guarded = ['id'];

    public function berita()
    {
    	return $this->belongsTo(Berita::class);
    }
}
