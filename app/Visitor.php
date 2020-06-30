<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Visitor extends Model
{
    protected $table = 'visitor';
    protected $guarded = ['id'];    
}
