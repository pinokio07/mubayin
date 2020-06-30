@extends('pages.news.master')
@section('header')
<style type="text/css">
	.active{color: white;}
</style>
@endsection

@section('content')
	<div class="content-wrapper">
    <div class="container px-xs-1">
      <div class="col-sm-12">
        <div class="card aos-init aos-animate" data-aos="fade-up">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-12">
                <h1 class="font-weight-600 mb-4">
                  @if(Request::segment(1) == 'pembaca')
                    Suara Pembaca
                  @else
                  {{Str::title(Request::segment(1))}}
                  @endif
                </h1>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-8">
              	@foreach($kegiatan as $k)
                <div class="row">
                  <div class="col-sm-4 grid-margin">
                    <div class="rotate-img">
                      <img src="{{$k->getFoto()}}" alt="banner" class="img-fluid">
                    </div>
                  </div>
                  <div class="col-sm-8 grid-margin">
                    <h2 class="font-weight-600 mb-2">
                      <a href="/news/{{$k->slug}}" class="text-dark text-decoration-none">{{Str::title(Str::words($k->judul, 7, ' ..'))}}</a>
                    </h2>
                    <p class="fs-13 text-muted mb-0">
                      <span class="mr-2">{{$k->penulis}} </span>{{$k->created_at->diffForHumans()}}
                    </p>
                    <p class="fs-15">
                    	{{ Str::title(Str::words($k->berita, 10))}} <a href="/news/{{$k->slug}}">Selengkapnya..</a>
                    </p>
                  </div>
                </div>
                @endforeach
                <div class="row">
                	{{$kegiatan->links("pagination::bootstrap-4")}}
                </div>
              </div>
              <div class="col-lg-4">
                <h2 class="mb-4 text-primary font-weight-600">
                  Banyak Dilihat
                </h2>
                @foreach($trending as $tr)
                <div class="row">
                  <div class="col-sm-12">
                    <div class="@if(!$loop->last) border-bottom pb-4 @endif pt-4">
                      <div class="row">
                        <div class="col-sm-8">
                          <h5 class="font-weight-600 mb-1">
                            <a href="/news/{{$tr->slug}}" class="text-dark text-decoration-none">{{ Str::title(Str::words($tr->judul, 5, ' ..'))}}</a>
                          </h5>
                          <p class="fs-13 text-muted mb-0">
                            <span class="mr-2">{{$tr->penulis}} </span>{{$tr->created_at->diffForHumans()}}
                          </p>
                        </div>
                        <div class="col-sm-4">
                          <div class="rotate-img">
                            <img src="{{$tr->getFoto()}}" alt="banner" class="img-fluid">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                @endforeach
                <div class="trending">
                  <h2 class="mb-4 text-primary font-weight-600">
                    Banyak Dikomentari
                  </h2>
                  @foreach($commented as $cm)
                  <div class="mb-4">
                    <div class="rotate-img">
                      <img src="{{$cm->getFoto()}}" alt="banner" class="img-fluid" style="max-height: 100px;">
                    </div>
                    <h3 class="mt-3 font-weight-600">
                      <a href="/news/{{$cm->slug}}" class="text-dark text-decoration-none">{{Str::title(Str::words($cm->judul, 5, ' ...'))}}</a>
                    </h3>
                    <p class="fs-13 text-muted mb-0">
                      <span class="mr-2">{{$cm->penulis}} </span>{{$cm->created_at->diffForHumans()}}
                    </p>
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