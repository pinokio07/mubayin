<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Berita;
use App\Cabang;
use Str;

class BeritaController extends Controller
{
    public function index(Request $request)
    {
    	$berita = Berita::latest()->get();
        $kategori = '';
    	$unreadKegiatan = Berita::where('kategori', 'kegiatan')->where('status', 'unread')->count();
    	$unreadKhutbah = Berita::where('kategori', 'khutbah')->where('status', 'unread')->count();
    	$unreadPembaca = Berita::where('kategori', 'pembaca')->where('status', 'unread')->count();
    	if($request->has('kategori')){
            $kategori = $request->kategori;
    		$berita = Berita::where('kategori', $request->kategori)->latest()->get();
    	}

    	return view('pages.admin.berita.berita', compact(['berita','unreadKegiatan','unreadKhutbah','unreadPembaca', 'kategori']));
    }

    public function baru()
    {
        $cabang = Cabang::all();
        return view('pages.admin.berita.baru', compact(['cabang']));
    }

    public function postberita(Request $request)
    {
        $slug = Str::slug($request->judul);
        $next = 2;

        // Loop sampai tidak ada slug duplicate
        while (Berita::where('slug', $slug)->first()) {
            $slug = $slug.'-'.$next;
            $next++;
        }

        $berita = new Berita;
        $berita->kategori = $request->kategori;
        $berita->cabang_id = $request->cabang_id;
        $berita->penulis = $request->penulis;
        $berita->email = $request->email;
        $berita->judul = $request->judul;
        $berita->slug = $slug;
        $berita->berita = $request->berita;
        $berita->status = 'active';
        $berita->save();

        if ($request->hasFile('foto')) {
            $ext = $request->file('foto')->getClientOriginalExtension();
            $ganti = preg_replace('/\s+/', '_', $slug);
            $nama = $ganti.'_'.round(microtime(true)).'.'.$ext;
            $request->file('foto')->move('images/berita/', $nama );
            $berita->foto = $nama;
            $berita->save();
        }

        return redirect('/admin/berita')->with('sukses', 'Berhasil membuat berita.');
    }

    public function view(Request $request)
    {
        $kategori = '';
    	$berita = Berita::findOrFail($request->artikel);        
        if ($berita->status == 'unread') {
           $berita->status = 'read';
           $berita->save();
        }
    	$unreadKegiatan = Berita::where('kategori', 'kegiatan')->where('status', 'unread')->count();
    	$unreadKhutbah = Berita::where('kategori', 'khutbah')->where('status', 'unread')->count();
    	$unreadPembaca = Berita::where('kategori', 'pembaca')->where('status', 'unread')->count();
    	//Next and Previous
        if($request->has('kategori') && $request->kategori != '') {
            $kategori = $request->kategori;
            $previous = Berita::where('kategori', $request->kategori)->where('id', '<', $berita->id)->max('id');
            $next = Berita::where('kategori', $request->kategori)->where('id', '>', $berita->id)->min('id');
        } else {
            $previous = Berita::where('id', '<', $berita->id)->max('id');
            $next = Berita::where('id', '>', $berita->id)->min('id');
        }

    	return view('pages.admin.berita.single', compact(['berita','unreadKegiatan','unreadKhutbah','unreadPembaca', 'next', 'previous', 'kategori']));
    }

    public function editjudul(Request $request)
    {
    	$berita = Berita::findOrFail($request->pk);
    	$berita->judul = $request->value;    	
    	$berita->save();    	
    }

    public function gantikategori(Request $request)
    {
        $berita = Berita::findOrFail($request->id);
        $berita->kategori = $request->kategori;
        $berita->save();
    }

    public function gantistatus(Request $request)
    {
        $berita = Berita::findOrFail($request->id);
        $berita->status = $request->status;
        $berita->save();
    }

    public function editberita(Request $request)
    {
    	$berita = Berita::findOrFail($request->id);
    	$berita->berita = $request->berita;    	
    	$berita->save();    	
    }

    public function gantifoto(Request $request)
    {
        $berita = Berita::findOrFail($request->id_berita);
        $slug = Str::slug(Str::words($berita->judul, 3, ''));        
        $fotolama = public_path().'/images/berita/'.$berita->foto;               
        //Simpan Gambar
        if($request->hasFile('foto')){
            if(!is_dir($fotolama) && file_exists($fotolama)){
                unlink($fotolama);
            }
            $ext = $request->file('foto')->getClientOriginalExtension();
            $ganti = preg_replace('/\s+/', '_', $slug);
            $nama = $ganti.'_'.round(microtime(true)).'.'.$ext;
            $request->file('foto')->move('images/berita/', $nama );
            $berita->foto = $nama;
            $berita->save();
        }

        return response()->json(['nama'=>$berita->foto]);
    }

    public function hapus(Berita $berita)
    {
        $foto = public_path().'/images/berita'.$berita->foto;
        //Hapus Komentar
        foreach ($berita->komentar as $k) {
           $k->delete();
        }        
        //Next        
        $next = Berita::where('id', '>', $berita->id)->min('id');
        if($next == null){
            $next = Berita::where('id', '<', $berita->id)->max('id');
        }
        //Cek dan Hapus Gambar
        if (!is_dir($foto) && file_exists($foto)) {
            unlink($foto);
        }
        $berita->delete();

        return redirect('/admin/berita/view?artikel='.$next)->with('sukses', 'Berhasil menghapus berita.');

    }
}
