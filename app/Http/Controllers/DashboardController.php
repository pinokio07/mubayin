<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Visitor;
use App\Berita;
use App\Testimoni;
use App\Komentar;

class DashboardController extends Controller
{
    public function index()
    {
    	//get User
    	$user = auth()->user();
    	//Get Dashboard Count
    	$visitor = Visitor::count();
    	$visitorToday = Visitor::whereDate('created_at', Carbon::today())->count();
    	$berita = Berita::where('status', 'active')->count();
    	$testimoni = Testimoni::where('status', 'active')->count();
    	//Get Dashboard Data
    	$beritaUnread = Berita::where('status', 'unread')->latest()->get();
    	$beritaAll = Berita::latest()->get();
    	$komentar = Komentar::latest()->get();

    	return view('pages.admin.dashboard', compact(['user','visitor', 'visitorToday', 'berita','testimoni', 'beritaUnread', 'beritaAll', 'komentar']));
    }
}
