<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Testimoni;
use App\Berita;

class TestimoniController extends Controller
{
    public function index()
    {
    	$testimoni = Testimoni::where('status', 'active')->latest()->paginate(6);
    	$pembaca = Berita::where('kategori', 'pembaca')
                    ->where('status', 'active')
                    ->orderBy('dibaca', 'desc')
                    ->take(6)
                    ->get();
      $cabang = \App\Cabang::all();

    	return view('pages.news.testimoni', compact(['testimoni','pembaca', 'cabang']));
    }

    public function post(Request $request)
    {
    	$testimoni = Testimoni::create($request->all());

    	return redirect('/testimoni')->with('thanks', 'Anda telah mengirimkan testimoni, posting anda sedang dalam moderasi.');
    }
}
