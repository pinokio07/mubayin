<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class AuthController extends Controller
{
	public function index()
	{
		if(Auth::check()){
			return redirect()->intended('/dashboard');
		}

		return view('pages.login');
	}

    public function login(Request $request)
    {
    	
		if (Auth::attempt($request->only('username', 'password'), true)) {
			return redirect()->intended('/dashboard');
		}    	
  		
  		return redirect()->route('login')->with('gagal', 'Username/Password Salah.');
    	
    }

    public function logout()
    {
    	Auth::logout();

    	return redirect()->route('login');
    }
}
