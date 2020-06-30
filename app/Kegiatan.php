<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kegiatan extends Model
{
    protected $table = 'kegiatan';
    protected $guarded = ['id'];

    public function gallery()
    {
    	return $this->hasMany(Gallery::class);
    }

    public function cabang()
    {
    	return $this->belongsTo(Cabang::class);
    }
}
