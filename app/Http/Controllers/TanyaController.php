<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\TanyaKami;
use App\Pertanyaan;
use App\Jawaban;

class TanyaController extends Controller
{
    public function index()
    {
    	return view('pages.news.pertanyaan');
    }

    public function send(Request $request)
    { 
        //dd($request->all());
        $rules = ['captcha' => 'required|captcha'];
        $validator = validator()->make(request()->all(), $rules);
        if ($validator->fails()) {
            return back()->withInput()->with('gagal', 'Captcha tidak sesuai.');
        } else {
            $pertanyaan = new Pertanyaan;
            $pertanyaan->nama = $request->nama ?? '';
            $pertanyaan->email = $request->email ?? '';
            $pertanyaan->telp = $request->telp;
            $pertanyaan->pertanyaan = $request->pertanyaan;
            $pertanyaan->save();

            return redirect('/tanya')->with('thanks', 'Kami akan membalas pertanyaan anda secepatnya.');
        }
    	
    }
}
