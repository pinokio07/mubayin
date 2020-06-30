<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Komentar;
use App\Berita;
use Str;

class KomentarController extends Controller
{
    public function post(Request $request)
    {    	
    	$komentar = new Komentar;
    	$komentar->berita_id = $request->berita_id;
    	$komentar->nama = $request->nama ?? 'Anonymous';
    	$komentar->email = $request->email ?? '';
    	$komentar->isi = $request->isi;
    	$komentar->save();

    	return redirect()->back()->with('sukses', 'Komentar anda sedang dalam moderasi.');
    }

    public function indexadmin()
    {
        $komentar = Komentar::latest()->get();

        return view('pages.admin.komentar.index', compact(['komentar']));
    }

    public function lihatberita(Request $request)
    {
        $berita = Berita::findOrFail($request->id);
        return response()->json([
            'judul' => Str::title($berita->judul),
            'penulis' => Str::title($berita->penulis ?? 'Administrator'),
            'src' => $berita->getFoto(),
            'created_at' => $berita->created_at->diffForHumans(),
            'berita' => $berita->berita,
        ]);
    }

    public function gantistatus(Request $request)
    {
        $komentar = Komentar::findOrFail($request->id);
        $komentar->status = $request->status;
        $komentar->save();
    }
}
