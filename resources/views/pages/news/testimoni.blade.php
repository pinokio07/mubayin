@extends('pages.news.master')
@section('header')
<style type="text/css">
	@media all and (max-width:480px) {
	  .custom-class { width: 100%; display:block; }
	}
</style>
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
  							<div class="card-title pb-3">
  								<div class="row">
  									<div class="col-lg-6 pb-2">Testimoni</div>
  									<div class="col-lg-6 text-right">
	                  	<button type="button" class="btn btn-primary shadow-sm custom-class" data-toggle="modal" data-target="#modalTambah">Beri Testimoni</button>
	                  </div>
  								</div>  								
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
                {{$testimoni->links()}}  
  						</div>
  						<div class="col-lg-4">
  							<h2 class="mb-4 text-primary font-weight-600">
                  <a href="/pembaca" class="text-primary text-decoration-none">Suara Pembaca</a>
                </h2>
                @foreach($pembaca as $pc)
                <div class="row">
                  <div class="col-sm-12">
                    <div class="@if(!$loop->last) border-bottom pb-4 @endif pt-4">
                      <div class="row">
                        <div class="col-sm-8">
                          <h5 class="font-weight-600 mb-1">
                            <a href="/news/{{$pc->slug}}" class="text-dark text-decoration-none">{{ Str::title(Str::words($pc->judul, 5, ' ..'))}}</a>
                          </h5>
                          <p class="fs-13 text-muted mb-0">
                            <span class="mr-2">{{$pc->penulis}} </span>{{$pc->created_at->diffForHumans()}}
                          </p>
                        </div>
                        <div class="col-sm-4">
                          <div class="rotate-img">
                            <img src="{{$pc->getFoto()}}" alt="banner" class="img-fluid">
                          </div>
                        </div>
                      </div>
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
</div>
<!-- Modal -->
<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog" aria-labelledby="labelModalTambah" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="labelModalTambah">Buat Testimoni</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/testimoni/post" method="POST" enctype="multipart/form-data">
      @csrf
      <div class="modal-body">
      	<div class="form-group">      		
      		<select class="form-control form-control-sm select2bs4" name="cabang_id" style="width: 100%" required="required">
      			<option></option>      			
      			@foreach($cabang as $c)
      			<option value="{{$c->id}}">{{$c->nama}} ({{$c->wilayah->nama}})</option>
      			@endforeach
      		</select>
      	</div>
      	<div class="form-group">      		
      		<input type="text" class="form-control form-control-sm" id="nama" name="nama" aria-describedby="nama" placeholder="Nama Lengkap" required="required" minlength="4">
      	</div>
      	<div class="form-group">      		
      		<input type="email" class="form-control form-control-sm" id="email" name="email" aria-describedby="email" placeholder="Email aktif" required="required">
      	</div>
      	<div class="form-group">      		
      		<textarea class="form-control form-control-sm" name="isi" placeholder="Tuliskan testimoni anda*" required="required" minlength="10"></textarea>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Tutup</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </div>
      </form>
    </div>
  </div>
</div>
@endsection

@section('footer')
<script type="text/javascript">
	$(function(){
    //Initialize Select2 Elements
    $('.select2').select2();    
    $('.select2bs4').select2({
      theme: 'bootstrap4',
      placeholder: "Pilih Cabang",
    	allowClear: true
    }); 
  });
</script>
@endsection