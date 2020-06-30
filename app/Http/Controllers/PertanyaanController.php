<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pertanyaan;
use Str;

class PertanyaanController extends Controller
{
    public function index()
    {
    	$pertanyaan = Pertanyaan::latest()->get();

    	return view('pages.admin.pertanyaan.index', compact(['pertanyaan']));
    }
}
