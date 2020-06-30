@extends('pages.news.master')

@section('content')
<!-- partial -->
@if($pengumuman != null && $pengumuman->start <= \Carbon\Carbon::now() && $pengumuman->end >= \Carbon\Carbon::now())
<div class="flash-news-banner p-2">
  <div class="container">
    <div class="d-lg-flex align-items-center justify-content-between">
      <div class="d-flex align-items-center">
        <span class="badge badge-dark mr-3">Pengumuman</span>
        <p class="mb-0">{{$pengumuman->isi}}</p>
      </div>
      <div class="d-flex">
        <span class="text-danger d-none d-sm-block">{{$pengumuman->created_at->diffForHumans()}}</span>
      </div>
    </div>
  </div>
</div>
@endif
<div class="content-wrapper pt-4">
  <div class="container px-xs-1">
    <div class="row" data-aos="fade-up">
        <div class="col-xl-8 stretch-card grid-margin pr-3 pr-md-0">
          <div class="position-relative w-100">
            <img src="{{$headline->getFoto()}}" alt="banner" class="img-fluid w-100 h-100" style="max-height: 450px;max-width: 100%;" />
            <div class="banner-content">
              <div class="badge badge-danger fs-12 font-weight-bold mb-3">
                terbaru
              </div>
              <h1 class="mb-0"><a class="text-white text-decoration-none" href="{{route('kegiatan.view.post', $headline->slug)}}">{{Str::title(Str::words($headline->judul, 7))}}</a></h1>
              <h5 class="mb-2">
                {!! Str::words($headline->berita, 10, ' ') !!} <a href="{{route('kegiatan.view.post', $headline->slug)}}" style="font-size: 12px;"> Selengkapnya</a>
              </h5>
              <div class="fs-12">
                <span class="mr-2">{{$headline->penulis}} </span>{{$headline->created_at->diffForHumans()}}
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-4 stretch-card grid-margin">
          <div class="card bg-dark text-white">
            <div class="card-body">
              <h2><a href="/kegiatan" class="text-light text-decoration-none">Berita terbaru</a></h2>
              @foreach($berita as $b)		                   
                <div class="d-flex align-items-center justify-content-between @if($loop->first) border-bottom-blue pt-3 pb-4 @elseif($loop->last) pt-4 @else border-bottom-blue pb-4 pt-4 @endif">
                  <div class="pr-3">
                    <h5><a class="text-white text-decoration-none" href="{{route('kegiatan.view.post', $b->slug)}}">{{Str::title(Str::words($b->judul, 5))}}</a></h5>
                    <div class="fs-12">
                      <span class="mr-2">{{$b->penulis}} </span>{{$b->created_at->diffForHumans()}}
                    </div>
                  </div>
                  <div class="div-w-25">
                    <div class="rotate-img">
                      <img src="{{$b->getFoto()}}" alt="thumb" class="img-fluid" style="max-width: 80px !important;" />
                    </div>
                  </div>
                </div>	                    
              @endforeach
            </div>
          </div>
        </div>
    </div>
    <div class="row" data-aos="fade-up">
      <div class="col-lg-3 stretch-card grid-margin">
        <div class="card">
          <div class="card-body">
            <h2><a href="/gallery/buku" class="text-dark text-decoration-none">Buku-buku</a></h2>
            <ul class="vertical-menu">
            	@foreach($buku as $b)
              <li><a href="{{route('buku.view', $b->slug)}}">{{Str::title($b->judul)}}</a></li>
              @endforeach              
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-9 stretch-card grid-margin">
        <div class="card">
          <div class="card-body">
          	@foreach($khutbah as $kt)
            <div class="row">
              <div class="col-sm-4 grid-margin">
                <div class="position-relative">
                  <div class="rotate-img">
                    <img src="{{$kt->getFoto()}}" alt="thumb" class="img-fluid"/>
                  </div>
                  <div class="badge-positioned">
                    <span class="badge badge-danger font-weight-bold">Khutbah</span>
                  </div>
                </div>
              </div>
              <div class="col-sm-8  grid-margin">
                <h2 class="mb-2 font-weight-600">
                  <a href="{{route('kegiatan.view.post', $kt->slug)}}" class="text-dark text-decoration-none">{{Str::title(Str::words($kt->judul, 7, ' ...'))}}</a>
                </h2>
                <div class="fs-13 mb-2">
                  <span class="mr-2">{{Str::title($kt->penulis)}} </span>{{$kt->created_at->diffForHumans()}}
                </div>
                <p class="mb-0">
                  {!! Str::words($kt->berita, 10) !!} <a href="{{route('kegiatan.view.post', $kt->slug)}}">Selengkapnya</a>
                </p>
              </div>
            </div>
            @endforeach
          </div>
        </div>
      </div>
    </div>    
    <div class="row" data-aos="fade-up">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-xl-8">
                <div class="card-title">
                  <a href="/pembaca" class="text-dark text-decoration-none">Suara Pembaca</a>
                </div>
                <div class="row">
                  @foreach($pembaca as $pb)
                    @if($loop->first)
                    <div class="col-xl-6 col-lg-8 col-sm-6">
                      <div class="rotate-img">
                        <img src="{{$pb->getFoto()}}" alt="thumb" class="img-fluid"/>
                      </div>
                      <h2 class="mt-3 text-primary mb-2">
                        <a href="{{route('kegiatan.view.post', $pb->slug)}}" class="text-dark text-decoration-none">{{Str::title($pb->judul)}}</a>
                      </h2>
                      <p class="fs-13 mb-1 text-muted">
                        <span class="mr-2">{{Str::title($pb->penulis)}} </span>{{$pb->created_at->diffForHumans()}}
                      </p>
                      <p class="my-3 fs-15">
                        {{ Str::title(Str::words($pb->berita, 10, '')) }}
                      </p>
                      <a href="{{route('kegiatan.view.post', $pb->slug)}}" class="font-weight-600 fs-16 text-dark text-decoration-none"
                        >Selengkapnya</a
                      >
                    </div>
                    @endif
                  @endforeach                  
                  <div class="col-xl-6 col-lg-4 col-sm-6">
                    @foreach($pembaca as $pb)
                      @if(!$loop->first)
                      <div @if(!$loop->last) class="border-bottom pb-3 mb-3" @endif>
                        <div class="row">
                          <div class="col-sm-3 pr-2 d-none d-sm-block">
                            <div class="rotate-img">
                              <img src="{{$pb->getFoto()}}" alt="thumb" class="img-fluid w-100"/>
                            </div>
                          </div>
                          <div class="col-sm-9">
                            <h3 class="font-weight-600 mb-0">
                              <a href="{{route('kegiatan.view.post', $pb->slug)}}" class="text-dark text-decoration-none">{{Str::title(Str::words($pb->judul, 3, ' ...'))}}</a>
                            </h3>
                            <p class="fs-13 text-muted mb-0">
                              <span class="mr-2">{{Str::title($pb->penulis)}} </span>{{$pb->created_at->diffForHumans()}}
                            </p>
                            <p class="mb-0">
                              {{Str::title(Str::words($pb->berita, 10, ' ...'))}}
                            </p>
                          </div>
                        </div>
                      </div>
                      @endif
                    @endforeach
                  </div>
                </div>
              </div>
              <hr class="w-100 d-block d-sm-none">
              <div class="col-xl-4">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="card-title">
                      <a href="/testimoni" class="text-dark text-decoration-none">Testimoni</a>
                    </div>
                    @foreach($testimoni as $ts)
                    <div class="@if(!$loop->last) border-bottom @endif @if(!$loop->first) pt-1 @endif pb-1">
                      <p class="fs-16 font-weight-600 mb-0 mt-2">
                        {{Str::title($ts->nama)}}
                      </p>
                      <p class="mb-0">
                        {{Str::words($ts->isi, 10, ' ...')}}
                      </p>
                      <p class="fs-13 text-muted mb-0">
                        {{$ts->created_at->diffForHumans()}}
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
  </div>
</div>
<!-- main-panel ends -->
<!-- container-scroller ends -->
@endsection