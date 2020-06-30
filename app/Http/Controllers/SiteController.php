<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Berita;
use App\Pengumuman;
use App\Buku;
use App\Testimoni;
use App\Visitor;

class SiteController extends Controller
{
    public function index()
    {
    	$pengumuman = Pengumuman::first();
    	$headline = Berita::where('kategori', 'kegiatan')
    							->where('status', 'active')
    							->latest()
    							->first();    	
    	$berita = Berita::where('kategori', 'kegiatan')
    							->where('status', 'active')
    							->latest()
    							->skip(1)
    							->take(3)
    							->get();
    	$khutbah = Berita::where('kategori', 'khutbah')
    							->where('status', 'active')
    							->latest()
    							->take(3)
    							->get();
    	$pembaca = Berita::where('kategori', 'pembaca')
    							->where('status', 'active')
    							->latest()
    							->take(5)
    							->get();
        $testimoni = Testimoni::where('status', 'active')->latest()->take(4)->get();    	
    	$buku = Buku::latest()->take(10)->get();

        Visitor::updateOrCreate([
            'ip' => getUserIp(),
            'created_at' => Visitor::whereDate('created_at', Carbon::today())->first()->created_at ?? null,
        ],[
            'count' => 1,
        ]);
               
    	return view('pages.news.index', compact(['pengumuman', 'headline', 'berita', 'khutbah', 'pembaca', 'buku', 'testimoni']));
    }
}
