<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Berita;
use Str;

class ArtikelController extends Controller
{
    public function index()
    {
    	$cabang = \App\Cabang::all();
    	return view('pages.news.artikel', compact(['cabang']));
    }

    public function post(Request $request)
    {
    	//cek slug duplicate
    	$slug = Str::slug($request->judul);
        $rules = ['captcha' => 'required|captcha'];
        $validator = validator()->make(request()->all(), $rules);
        if ($validator->fails()) {
            return back()->withInput()->with('gagal', 'Captcha tidak sesuai.');
        } else {
            $duplicate = Berita::where('slug', $slug)->first();

            if ($duplicate != null) {
                $slug .= '-'.+1;
            }

            $artikel = new Berita;
            $artikel->kategori = 'pembaca';
            $artikel->cabang_id = $request->cabang_id;
            $artikel->penulis = $request->penulis;
            $artikel->email = $request->email;
            $artikel->judul = $request->judul;
            $artikel->slug = $slug;
            $artikel->berita = $request->berita;
            $artikel->save();

            if ($request->hasFile('foto')) {
                $ext = $request->file('foto')->getClientOriginalExtension();
                $ganti = preg_replace('/\s+/', '_', $slug);
                $nama = $ganti.'_'.round(microtime(true)).'.'.$ext;
                $request->file('foto')->move('images/berita/', $nama );
                $artikel->foto = $nama;
                $artikel->save();
            }

            return redirect('/kirim')->with('sukses', 'Artikel anda telah berhasil terkirim, harap tunggu moderasi dari Admin.');
        }    	
    }
}
