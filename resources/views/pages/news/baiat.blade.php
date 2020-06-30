@extends('pages.news.master')
@section('header')
<style type="text/css">
	li:not(:last-child){margin-bottom: 8px;}	
</style>
@endsection

@section('content')
<div class="content-wrapper pt-4">
  <div class="container px-xs-1">
  	<div class="row" data-aos="fade-up">
  		<div class="col-sm-12 grid-margin">
  			<div class="card m-1">
  				<div class="card-body">
  					<div class="row">
  						<div class="col-lg-8">
  							<h1 class="font-weight-600 mb-4">Bai'at</h1>  							
  							<img src="{{asset('/images/berita/baiat.jpg')}}" class="image-wrapper w-100 mb-4">
	  						<p class="text-justify m-0" style="text-indent: 2em;font-family: 'Raleway', sans-serif;font-size: 12pt;">
	  							Istilah Arab bai'at telah diterjemahkan di sini sebagai "janji" atau "inisiasi", tetapi makna sebenarnya jauh lebih mendalam daripada janji sederhana. Dengan demikian, Mesias yang Dijanjikan (as) berkata: "Bai'at benar-benar berarti untuk menjual diri; berkah dan dampaknya didasarkan pada kondisi itu. Sama seperti benih ditaburkan ke tanah, kondisi aslinya adalah bahwa tangan petani telah menaburkannya, tetapi tidak diketahui apa yang akan terjadi padanya. <br>
	  							Jika bibit berkualitas baik dan memiliki kapasitas untuk tumbuh, maka dengan rahmat Allah SWT, dan sebagai konsekuensi dari pekerjaan yang dilakukan oleh petani, bibit tumbuh sampai satu butir dan kemudian berubah menjadi seribu butir. Demikian pula dengan orang yang melakukan bai'at harus terlebih dahulu berusaha untuk memiliki kerendahan diri dan kerendahan hati dan harus menjauhkan diri dari dengki dan keegoisannya. Maka orang itu menjadi pantas untuk peningkatan dirinya. Tetapi dia yang terus berpegang pada egonya, bersama dengan mengambil bai'at, tidak akan pernah menerima rahmat apa pun. "[Malfoozat, vol. 6, hal. 173] <br>
	  							<img src="{{asset('images/berita/baitpage.jpg')}}" class="image-wrapper float-left pr-3 w-50">
	  							"Tujuan mereka bergabung dengan ajaran dan menjalin hubungan dengan saya seperti seorang murid adalah agar mereka mencapai tingkat kesalehan dan kebenaran yang tinggi. Tidak boleh mereka melakukan perbuatan buruk atau kerusakan yang terjadi di dekat mereka. Mereka harus melakukan shalat lima waktu secara teratur dan dengan jemaat, dan tidak seharusnya berbohong atau melukai siapa pun dengan lidah mereka. <br>
	  							Mereka seharusnya tidak berbuat segala jenis kejahatan dan tidak boleh membiarkan dalam pikiran mereka untuk melakukan kejahatan, kesalahan atau pelanggaran. Mereka harus menghindari segala jenis dosa, pelanggaran, ucapan dan tindakan yang tidak diinginkan, serta semua hasrat egoistis dan perilaku yang tidak teratur. Mereka harus menjadi hamba yang murni, hamba Allah SWT yang lemah lembut, dan tidak ada penyakit hati yang tumbuh di dalam diri mereka. "[Essence of Islam, Vol. IV, hlm. 349 - 250] <br>
	  							"Adalah salah untuk mengatakan bahwa siapa pun yang jalan di jalan Allah SWT pada akhirnya akan menderita kerugian. Orang yang benar tidak akan pernah bisa dalam keadaan kehilangan. <br>	  							
	  							Hanya dia yang palsu - yaitu yang, demi keuntungan duniawi, melanggar janji yang telah dibuatnya dengan Allah SWT - menderita kerugian. <br>
	  							<img src="{{asset('images/berita/promisedmessiah.jpg')}}" class="image-wrapper float-right pl-3 w-25">
	  							Seseorang yang melakukan tindakan seperti itu karena takut akan dunia harus ingat bahwa pada saat kematiannya tidak ada penguasa atau raja dunia ini yang akan datang untuk mendapatkan pembebasannya. <br>
	  							Dia harus menyerahkan diri kepada Hakim semua hakim, -yaitu Dia- yang bertanya kepadamu, 'Mengapa kamu tidak menghormati Aku?' Karena itu, sangat penting bagi semua orang beriman untuk percaya kepada Allah SWT, Raja langit dan bumi dan kepadaNya lah tempat kembali. "[Malfoozat, vol. 7, hlm. 29-30]
	  						</p>
  						</div>
  						<div class="col-lg-4" style="background-color: #f2f2f2;">
  							<div class="d-flex justify-content-center align-items-center border-bottom pt-3 pb-3">
                  10 Janji Bai'at :                
                </div>
                <ol class="text-justify mt-3 pl-2" style="font-family: 'Raleway', sans-serif;font-size: 12pt;">
                	<li>Bahwa ia harus menjauhkan diri dari Syirik (menyekutukan apapun dengan Allah SWT) sampai hari kematiannya.</li>
                	<li>Bahwa ia harus menjauhkan diri dari kebohongan, percabulan, perzinaan, pelanggaran mata, pesta pora, pemborosan, kekejaman, ketidakjujuran, ketidakjujuran, kerusakan dan pemberontakan; dan tidak akan membiarkan dirinya terbawa oleh nafsu, betapapun kuatnya itu.</li>
                	<li>Bahwa dia akan secara teratur melakukan shalat lima waktu sesuai dengan perintah-perintah Allah SWT dan Nabi Muhammad SAW; dan akan mencoba yang terbaik untuk tetap teratur dalam mempersembahkan Tahajud (sholat sebelum subuh) dan memohon Darood (Shalawat) pada Nabi Muhammad SAW; bahwa dia akan meminta pengampunan atas dosa-dosanya sebagai rutinitas sehari-hari, untuk mengingat karunia Allah SWT dan untuk memuji dan memuliakan Dia.</li>
                	<li>Bahwa walaupun didorongan dengan nafsu apa pun, ia tidak akan menyebabkan kerugian apa pun terhadap makhluk Allah SWT pada umumnya, dan umat Islam pada khususnya, baik dengan lidahnya atau dengan tangannya atau dengan cara lain.</li>
                	<li>Bahwa ia akan tetap setia kepada Allah SWT dalam segala situasi kehidupan, dalam kesedihan dan kebahagiaan, dalam kesengsaraan dan kemakmuran, dalam kemudahan dan cobaan; dan dalam segala kondisi akan tetap tunduk pada ketetapan Allah SWT dan menjaga dirinya siap untuk menghadapi segala macam penghinaan dan penderitaan di jalan-Nya dan tidak akan pernah berpaling darinya atas cobaan apa pun; sebaliknya, dia akan maju.</li>
                	<li>Bahwa ia akan menahan diri dari mengikuti kebiasaan yang tidak Islami dan godaan hawa nafsu, dan akan sepenuhnya menyerahkan dirinya kepada ajaran Al-Quran; dan akan menjadikan Firman Allah SWT dan Perkataan Nabi Muhammad SAW sebagai bimbingan dalam setiap perjalanan hidupnya.</li>
                	<li>Bahwa dia akan sepenuhnya melepaskan harga diri dan kesombongan dan akan melewatkan seluruh hidupnya dalam kerendahan hati, rasa syukur, kesabaran, dan kelembutan.</li>
                	<li>Bahwa ia akan menjaga keimanan, kehormatan imannya, dan tujuan Islam lebih berharga baginya daripada nyawanya, kekayaan, kehormatan, anak-anak, dan semua orang terkasih lainnya.</li>
                	<li>Bahwa ia akan menyibukkan dirinya dalam pelayanan terhadap makhluk-makhluk Allah SWT karena-Nya; dan akan berusaha untuk memberi manfaat bagi umat manusia sekuat kemampuan dan kekuatannya yang diberikan Allah SWT.</li>
                	<li>Bahwa dia akan masuk ke dalam ikatan persaudaraan dengan hamba Allah SWT yang rendah hati ini (Al - Masih AS), berjanji patuh kepada saya dalam segala hal yang baik, karena Allah SWT, dan tetap setia pada janji itu sampai hari kematiannya; bahwa dia akan melakukan pengabdian yang begitu tinggi dalam mematuhi ikatan ini yang tidak dapat ditemukan dalam hubungan dan koneksi duniawi lainnya yang menuntut ketaatan dengan penuh pengabdian.</li>
                </ol>
  						</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  </div>
</div>
@endsection

@section('footer')

@endsection