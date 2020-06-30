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
							@foreach($kegiatan as $k)
							<div class="col-md-4 border-bottom pb-3 mb-3">
                <div class="row">
                  <div class="col-sm-3 pr-2 d-none d-sm-block">
                    <div class="rotate-img">
                    	@foreach($k->gallery as $g)
                    		@if($loop->last)
                      	<img src="{{asset('/images/gallery/'.$g->foto)}}" alt="thumb" class="img-fluid w-100"/>
                      	@endif
                      @endforeach
                    </div>
                  </div>
                  <div class="col-sm-9">
                    <h3 class="font-weight-600 mb-0">
                      <a href="/gallery/foto?fid={{$k->id}}" class="text-dark text-decoration-none">{{Str::title(Str::words($k->nama, 5))}}</a>
                    </h3>
                    <p class="fs-13 text-muted mb-0">
                     {{$k->created_at->diffForHumans()}}
                    </p>
                  </div>
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
@endsection

@section('footer')

@endsection