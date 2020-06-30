<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Berita extends Model
{
    protected $table = 'berita';
    protected $guarded = ['id'];    

    public function getFoto()
    {
    	if (!$this->foto) {
    		if($this->kategori == 'khutbah'){
    			return asset('/images/khutbah.jpg');
    		} else {
    			return asset('/images/default.jpg');
    		}    		
    	}
    	return asset('/images/berita/'.$this->foto);
    }

    public function komentar()
    {
        return $this->hasMany(Komentar::class);
    }
   
    public function cabang()
    {
    	return $this->belongsTo(Cabang::class);
    }
}
