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
                  Buku {{Str::title($buku->judul)}}
                </div>
                <div class="row">
                	<div class="col-sm-4 grid-margin">
              			<div class="rotate-img">
              				<img src="{{$buku->getCover()}}" alt="thumb" class="img-fluid" style="width: 200px;height: 250px;"/>
              			</div>
                	</div>
                  <div class="col-sm-8 grid-margin">
                   	<table class="table table-sm">
	                   	<tr>
	                   		<td>Judul Asli</td>
	                   		<td>:</td>
	                   		<td style="min-width: 50%;">{{Str::title($buku->judul_asli ?? '-') }}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Penulis</td>
	                   		<td>:</td>
	                   		<td>{{Str::title($buku->penulis ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Penerjemah</td>
	                   		<td>:</td>
	                   		<td>{{Str::title($buku->penerjemah ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Editor</td>
	                   		<td>:</td>
	                   		<td>{{Str::title($buku->editor ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Edisi</td>
	                   		<td>:</td>
	                   		<td>{{Str::title($buku->edisi ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Ukuran</td>
	                   		<td>:</td>
	                   		<td>{{Str::upper($buku->ukuran ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Halaman</td>
	                   		<td>:</td>
	                   		<td>{{Str::upper($buku->halaman ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td>Penerbit</td>
	                   		<td>:</td>
	                   		<td>{{Str::title($buku->penerbit ?? '-')}}</td>
	                   	</tr>
	                   	<tr>
	                   		<td colspan="100%">
	                   			<a href="{{asset('/files/buku/'.$buku->file)}}" class="btn btn-info btn-block" target="_blank">Download</a>
	                   		</td>
	                   	</tr>
	                   </table>
                  </div>
                  <div class="col-sm-12 grid-margin">
                  	<div class="card-title">Sinopsis</div>
                  	<p class="text-justify" style="text-indent: 2em;">{!! $buku->sinopsis ?? '-' !!}</p>
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
	                				@foreach($semua as $s)
		                				<tr>
		                					<td><a href="{{route('buku.view', $s->slug)}}" class="text-dark text-decoration-none">{{Str::title($s->judul)}}</a></td>
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