@extends('pages.news.master')
@section('header')
<style type="text/css">
	.dataTables_filter {
		text-align: left !important;
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
                <div class="card-title">
                  Buku - Buku
                </div>
                <div class="row">
                	@foreach($headline as $h)
                  <div class="col-sm-6 grid-margin">
                    <div class="position-relative">
                      <div class="rotate-img">
                        <a href="{{route('buku.view', $h->slug)}}">
                        <img src="{{$h->getCover()}}" alt="thumb" class="img-fluid" style="width: 100%;height: 300px;"/></a>
                      </div>
                      <div class="badge-positioned w-90">
                        <div class="d-flex justify-content-between align-items-center">
                          <span class="badge badge-danger font-weight-bold"><small>{{Str::title($h->judul)}}</small></span>
                          <a href="{{asset('/files/buku/'.$h->file)}}" target="_blank">
                          <div class="video-icon">
                            <i class="mdi mdi-cloud-download-outline"></i>
                          </div></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  @endforeach
                  <div class="col-sm-12 justify-content-between align-items-center">
                  	{{$headline->links()}}
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
              	<div class="card-title">
                  Daftar
                </div>
                <div class="row">
                	<div class="col-sm-12">
                		<div class="table-responsive">
                			<table class="table table-sm" id="dataBuku" width="100%">
	                			<thead>
	                				<tr>
	                					<th>Judul</th>
	                				</tr>
	                			</thead>
	                			<tbody>
	                				@foreach($buku as $b)
		                				<tr>
		                					<td><a href="{{route('buku.view', $b->slug)}}" class="text-dark">{{Str::title($b->judul)}}</a></td>
		                				</tr>
		                			@endforeach
	                			</tbody>
	                		</table>
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
</div>
@endsection

@section('footer')
<script type="text/javascript">
	jQuery(document).ready(function(){
		var domCfg = "<'row'<'col-sm-12'f>>";

		$('#dataBuku').DataTable({
			info: false,
			paging: false,
			scrollY: 600,
			dom: domCfg,
			"oLanguage": {
		   "sSearch": "Cari"
		 },
		});
	});
</script>
@endsection