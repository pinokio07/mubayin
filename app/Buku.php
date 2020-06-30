<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    protected $table = 'buku';
    protected $guarded = ['id'];

    public function getCover()
    {
    	return !$this->cover ? asset('images/cover.jpg') : asset('images/buku/'.$this->cover);
    }
}
