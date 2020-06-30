@extends('pages.news.master')
@section('header')

@endsection

@section('content')
<div class="content-wrapper pt-4">
  <div class="container px-xs-1">
  	<div class="row" data-aos="fade-up">
  		<div class="col-sm-12 grid-margin">
  			<div class="card">
  				<div class="card-body">
  					<div class="row">
  						<div class="col-lg-8">
  							<h3 class="font-weight-600 mb-0">{{Str::title($berita->judul)}}</h3>
  							<p class="fs-13 text-muted mb-4">{{Str::title($berita->penulis ?? 'Administrator')}} - {{$berita->created_at->diffForHumans()}}</p>
  							<img src="{{$berita->getFoto()}}" class="image-wrapper float-left pr-3 w-50">
	  						<p class="text-justify">{!!$berita->berita!!}</p>
  						</div>
  						<div class="col-lg-4">
  							<div class="d-flex justify-content-between align-items-center">
                  <div class="card-title">
                    Berita Terkait
                  </div>                  
                </div>
                @foreach($terkait as $tk)
                <div class="d-flex align-items-center border-bottom pb-2 @if(!$loop->first) pt-3 @endif">
                  <div class="div-w-80 mr-3">
                    <div class="rotate-img">
                      <img src="{{$tk->getFoto()}}" alt="thumb" class="img-fluid" style="max-width: 80px !important;">
                    </div>
                  </div>
                  <h3 class="font-weight-100 mb-0">
                  	<a href="{{route('kegiatan.view.post', $tk->slug)}}" class="text-decoration-none text-dark">{{ Str::title(Str::words($tk->judul, 5, '')) }}</a>
                  </h3>
                </div>
                @endforeach
  						</div>
	  					<div class="col-lg-8">
	  						<hr class="w-100">               
	  						<div class="d-flex justify-content-between align-items-center">
                  <div class="card-title">
                    Beri Tanggapan
                  </div>                  
                </div>
                <form action="{{route('post.komentar')}}" method="POST" enctype="multipart/form-data">
	  						@csrf
                <input type="hidden" name="berita_id" value="{{$berita->id}}">
                <div class="row">
  								<div class="col-sm-12">
  									<div class="form-group">
	  									<textarea class="form-control" name="isi" placeholder="Komentar Anda" style="height: 100px !important;" required="required" minlength="10"></textarea>
	  								</div>
  								</div>
  							</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input type="text" class="form-control" name="nama" placeholder="Biarkan kosong untuk anonymous">
										</div>
									</div>
									<div class="col-sm-6">
										<input type="email" class="form-control" name="email" placeholder="Masukkan Email">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<button type="submit" class="btn btn-primary btn-lg font-weight-bold mt-1"> Kirim</button>
										</div>
									</div>
								</div>
                </form>                
								<div class="d-flex justify-content-between align-items-center">
                  <div class="card-title">
                    Komentar
                  </div>
                  <hr class="w-75">                
                </div>
								@foreach($komentar as $komen)
								<div class="card">
									<div class="card-header py-2 px-3">
										<h6 style="background: #f9f9f9; ">{{$komen->nama ?? ''}} - {{$komen->created_at->diffForHumans()}}</h6>
									</div>
									<div class="card-body py-2 px-1">
										<p class="text-justify">{!!$komen->isi!!}</p>
									</div>
								</div>								
								@endforeach 						
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