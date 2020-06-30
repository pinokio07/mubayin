<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Buku;
use App\Gallery;
use App\Kegiatan;

class GalleryController extends Controller
{
    public function buku()
    {
    	$headline = Buku::latest()->paginate(4);
    	$buku = Buku::orderBy('judul', 'asc')->get();

    	return view('pages.news.buku', compact(['headline', 'buku']));
    }

    public function single($slug)
    {
    	$buku = Buku::where('slug', $slug)->first();
    	$semua = Buku::orderBy('judul', 'asc')->get();

    	return view('pages.news.singlebook', compact(['buku', 'semua']));
    }

    public function foto(Request $request)
    {
        $kegiatan = Kegiatan::all();
        if ($request->has('fid')) {
            $foto = Kegiatan::find($request->fid);
            $kegiatan = Kegiatan::where('id', '<>', $request->fid)->latest()->take(6)->get();
            return view('pages.news.singlefoto', compact(['foto', 'kegiatan']));
        }

        return view('pages.news.foto', compact(['kegiatan']));
    }
}
