<?php
use App\Berita;
use App\Komentar;
use App\Pertanyaan;
use App\Testimoni;

function unreadBerita(){
	return Berita::where('status', 'unread')->count();
}
function unreadKomentar(){
	return Komentar::where('status', 'unread')->count();
}
function unreadPertanyaan(){
	return Pertanyaan::where('status', 'unread')->count();
}
function unreadTestimoni(){
	return Testimoni::where('status', 'unread')->count();
}
function getUserIP() {	
	if ( !empty($_SERVER['HTTP_CLIENT_IP']) ) {	
		// Check IP from internet.  
	  return $_SERVER['HTTP_CLIENT_IP'];
	} elseif( array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ) {
		// Check IP is passed from proxy.
    if (strpos($_SERVER['HTTP_X_FORWARDED_FOR'], ',')>0) {
        $addr = explode(",",$_SERVER['HTTP_X_FORWARDED_FOR']);
        return trim($addr[0]);
    } else {
        return $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
  }
  else {
		// Get IP address from remote address.
    return $_SERVER['REMOTE_ADDR'];
  }
}