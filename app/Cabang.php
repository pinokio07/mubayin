<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cabang extends Model
{
    protected $table = 'cabang';
    protected $guarded = ['id'];

    public function wilayah()
    {
    	return $this->belongsTo(Wilayah::class);
    }

    public function berita()
    {
    	return $this->hasMany(Berita::class);
    }

    public function testimoni()
    {
    	return $this->hasMany(Testimoni::class);
    }

    public function kegiatan()
    {
        return $this->hasMany(Kegiatan::class);
    }
}
