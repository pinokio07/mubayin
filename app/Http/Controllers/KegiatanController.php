<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Berita;

class KegiatanController extends Controller
{
    public function kegiatan()
    {
        $commented = Berita::withCount(['komentar' => function($query) {
                        $query->where('status', 'active');
                    }])
                    ->where('kategori', 'kegiatan')
                    ->where('status', 'active')
                    ->orderBy('komentar_count', 'desc')
                    ->take(3)
                    ->get();

        $trending = Berita::where('kategori', 'kegiatan')
                    ->where('status', 'active')
                    ->orderBy('dibaca', 'desc')
                    ->take(3)
                    ->get();

        $kegiatan = Berita::where('kategori', 'kegiatan')
                    ->where('status', 'active')                    
                    ->latest()
                    ->paginate(6);
        
        return view('pages.news.kegiatan', compact(['kegiatan', 'trending', 'commented']));
    }

    public function khutbah()
    {
        $kegiatan = Berita::where('kategori', 'khutbah')
                    ->where('status', 'active')                    
                    ->latest()
                    ->paginate(6);
        $trending = Berita::where('kategori', 'khutbah')
                    ->where('status', 'active')
                    ->orderBy('dibaca', 'desc')
                    ->take(3)
                    ->get();
        $commented = Berita::withCount(['komentar' => function($query) {
                        $query->where('status', 'active');
                    }])
                    ->where('kategori', 'khutbah')
                    ->where('status', 'active')
                    ->orderBy('komentar_count', 'desc')
                    ->take(3)
                    ->get();

        return view('pages.news.kegiatan', compact(['kegiatan', 'trending', 'commented']));
    }

    public function pembaca()
    {
        $kegiatan = Berita::where('kategori', 'pembaca')
                    ->where('status', 'active')                    
                    ->latest()
                    ->paginate(6);
        $trending = Berita::where('kategori', 'pembaca')
                    ->where('status', 'active')
                    ->orderBy('dibaca', 'desc')
                    ->take(3)
                    ->get();
        $commented = Berita::withCount(['komentar' => function($query) {
                        $query->where('status', 'active');
                    }])
                    ->where('kategori', 'pembaca')
                    ->where('status', 'active')
                    ->orderBy('komentar_count', 'desc')
                    ->take(3)
                    ->get();

        return view('pages.news.kegiatan', compact(['kegiatan', 'trending', 'commented']));
    }

    public function viewpost($slug)
    {
    	$berita = Berita::where('slug', $slug)->first();    	
    	$berita->dibaca = $berita->dibaca + 1;
    	$berita->save();
    	$terkait = Berita::where('id', '<>', $berita->id)
    						 ->where('kategori', '=', $berita->kategori)
    						 ->latest()
    						 ->take(5)
    						 ->get();
        $komentar = $berita->komentar->where('status', 'active');

    	return view('pages.news.single', compact(['berita', 'terkait', 'komentar']));
    }
}
