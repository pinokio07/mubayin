@extends('pages.news.master')
@section('header')
<link rel="stylesheet" type="text/css" href="{{asset('/fotorama/fotorama.css')}}">
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
  							<h3 class="font-weight-600 mb-4">{{Str::title($foto->nama)}}</h3>
  							<div class="fotorama" data-nav="thumbs" data-transition="crossfade" data-width="100%">
		  						@foreach($foto->gallery as $gallery)
								  <a href="{{asset('/images/gallery/'.$gallery->foto)}}"><img src="{{asset('/images/gallery/'.$gallery->foto)}}"></a>
								  @endforeach						  
								</div>
  						</div>
  						<div class="col-lg-4">
  							<div class="d-flex justify-content-between align-items-center">
                  <div class="card-title">
                    Gallery Lainnya
                  </div>                  
                </div>
                @foreach($kegiatan as $k)
                <div class="d-flex align-items-center border-bottom pb-2 @if(!$loop->first) pt-3 @endif">
                  <div class="div-w-80 mr-3">
                    <div class="rotate-img">
                    	@foreach($k->gallery as $g)
                    		@if($loop->last)
                      		<img src="{{asset('/images/gallery/'.$g->foto)}}" alt="thumb" class="img-fluid" style="max-width: 80px !important;">
                      	@endif
                      @endforeach
                    </div>
                  </div>
                  <h3 class="font-weight-100 mb-0">
                  	<a href="/gallery/foto?fid={{$k->id}}" class="text-decoration-none text-dark">{{ Str::title(Str::words($k->nama, 5, '')) }}</a>
                  </h3>
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
<script src="{{asset('/fotorama/fotorama.js')}}"></script>
@endsection