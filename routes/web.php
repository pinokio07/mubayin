<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Redirect Home
Route::get('/', function () {
    return redirect('/news');
});
//Site Routes
Route::get('/news', 'SiteController@index');
Route::get('/kegiatan', 'KegiatanController@kegiatan');
Route::get('/khutbah', 'KegiatanController@khutbah');
Route::get('/pembaca', 'KegiatanController@pembaca');
//Get Slug for Single Page
Route::get('/news/{slug}', 'KegiatanController@viewpost')->name('kegiatan.view.post');
//Post a Comment
Route::post('/postkomentar', 'KomentarController@post')->name('post.komentar');
//Baiat Route
Route::get('/baiat', function(){
	return view('pages.news.baiat');
});
//Gallery Routes
Route::get('/gallery/buku', 'GalleryController@buku');
Route::get('/buku/{slug}', 'GalleryController@single')->name('buku.view');
//Pictures Route
Route::get('/gallery/foto', 'GalleryController@foto');
//Tanya Routes
Route::get('/tanya', 'TanyaController@index');
Route::post('/tanya/kirim', 'TanyaController@send')->name('tanya.kami');
//Testimoni Routes
Route::get('/testimoni', 'TestimoniController@index');
Route::post('/testimoni/post', 'TestimoniController@post');
//Artikel Routes
Route::get('/kirim', 'ArtikelController@index');
Route::post('/kirim/post', 'ArtikelController@post')->name('kirim.artikel');
//Login Routes
Route::get('/webadmin', 'AuthController@index')->name('login');
Route::post('/postlogin', 'AuthController@login');
//Admin Routes
Route::group(['middleware' => 'auth'], function(){
	Route::get('/dashboard', 'DashboardController@index');
	Route::get('/logout', 'AuthController@logout');

	//Admin Berita Routes
	Route::get('/admin/berita', 'BeritaController@index');
	Route::get('/admin/berita/new', 'BeritaController@baru');
	Route::post('/admin/berita/post', 'BeritaController@postberita');
	Route::get('/admin/berita/view', 'BeritaController@view');
	Route::post('/admin/berita/gantikategori', 'BeritaController@gantikategori')->name('berita.ganti.kategori');
	Route::post('/admin/berita/gantistatus', 'BeritaController@gantistatus')->name('berita.ganti.status');
	Route::post('/admin/berita/gantifoto', 'BeritaController@gantifoto')->name('berita.ganti.foto');
	Route::get('/admin/berita/hapus/{berita}', 'BeritaController@hapus');
	//Admin Komentar Routes
	Route::get('/admin/komentar', 'KomentarController@indexadmin');
	Route::get('/admin/komentar/lihatberita', 'KomentarController@lihatberita')->name('komentar.berita.view');
	Route::post('/admin/komentar/gantistatus', 'KomentarController@gantistatus')->name('komentar.ganti.status');
	//Admin Pertanyaan Routes
	Route::get('/admin/pertanyaan', 'PertanyaanController@index');
});

