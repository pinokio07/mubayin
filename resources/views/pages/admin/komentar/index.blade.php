@extends('layouts.admin.master')

@section('header')
<title>Admin MB | Komentar</title>
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Komentar</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
          <li class="breadcrumb-item active">Komentar</li>          
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="card card-primary card-outline">
    <div class="card-header">
      <h3 class="card-title">Komentar</h3>          
    </div>
    <!-- /.card-header -->
    <div class="card-body mailbox-messages">
      <table class="table table-sm" width="100%" id="dataBerita">
      	<thead>
      		<tr>          			
      			<th>Komentar</th>      			
      		</tr>
      	</thead>
      	<tbody>
      		@foreach($komentar as $k)
      			<tr>
      				<td>
      					<div class="post">
	                <div class="user-block">
	                	<img class="img-circle img-bordered-sm" src="{{asset('images/user-default.png')}}" alt="user image">	                  
	                  <span class="username">
	                    <a href="#">{{Str::title($k->nama)}}</a>
	                    @if($k->status == 'unread')
	                    <span class="right badge badge-info">New</span>
	                    @elseif($k->status == 'rejected')
	                    <span class="right badge badge-danger">Rejected</span>
	                    @elseif($k->status == 'inactive')
	                    <span class="right badge badge-warning">Inactive</span>
	                    @endif
	                  </span>
	                  <span class="description">Ditulis - {{$k->created_at->diffForHumans()}}</span>
	                </div>
	                <!-- /.user-block -->
	                <p class="text-dark">
	                  {!!$k->isi!!}
	                </p>
	                <div class="row card-footer p-1">
	                	<div class="col-sm-6">
	                		@if($k->email != null )
		                  	<a href="mailto:{{$k->email}}" class="link-black text-sm"><i class="fas fa-envelope mr-1"></i> {{$k->email}}</a>
		                 	@endif
	                	</div>
	                	<div class="col-sm-6 text-right">
	                		<div class="button-group">
	                 			<button type="button" class="btn btn-danger btn-sm delete" data-toggle="tooltip" data-container="body" data-id="{{$k->id}}" title="Delete">
		                    <i class="far fa-trash-alt"></i></button>
		                    <span data-toggle="modal" data-target="#modalView">
		                    <button type="button" class="btn btn-info btn-sm cek" data-toggle="tooltip" data-container="body" data-id="{{$k->berita->id}}" title="Lihat Berita"><i class="fas fa-eye"></i></button></span>
		                    <button type="button" class="btn btn-default btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$k->id}}" data-status="inactive" title="Unpublish"><i class="fas fa-eye-slash"></i></button>
			                  <button type="button" class="btn btn-success btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$k->id}}" data-status="active" title="Publish">
			                    <i class="fas fa-check"></i></button>                  
			                  <button type="button" class="btn btn-warning btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$k->id}}" data-status="rejected" title="Reject">
			                    <i class="fas fa-times"></i></button>
	                 		</div>
	                	</div>
	                </div>
	              </div>
      				</td>      				
      			</tr>
      		@endforeach
      	</tbody>
      </table>
    </div>
    <!-- /.card-body -->
    <div class="card-footer p-0">
      
    </div>
  </div>
  <!-- /.card -->    
</section>
<!-- /.content -->
<!-- Modal -->
<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="modalViewLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalViewLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="fs-13 text-muted mb-4"><span id="modalPenulis"></span> - <span id="modalCreated"></span></p>
				<img src="" class="image-wrapper float-left pr-3 w-50" id="modalFoto">
				<p class="text-justify" id="modalBerita"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>        
      </div>
    </div>
  </div>
</div>
@endsection

@section('footer')
<script type="text/javascript">	
 jQuery(document).ready(function(){
 	$('#dataBerita').DataTable({
    responsive:true,    
    stateSave: true,
    ordering: false,    
  });
  //Set Status
  $('.stat').click(function(){
  	var id = $(this).data('id');
  	var status = $(this).data('status');
  	var _token = $('meta[name="csrf-token"]').attr('content');

  	Swal.fire({
	  title: 'Ganti Status?',
	  text: "Status komentar akan diganti!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Ya, ganti!'
		}).then((result) => {
		  if (result.value) {
		   $.ajax({
		   	url: "{{route('komentar.ganti.status')}}",
		   	type: "POST",
		   	data:{
		   		id:id,
		   		status:status,
		   		_token:_token,
		   	},
		   	success:function(){
		   		location.reload();
		   	}
		   });
		  }
		});
  });
  //Delete Berita
  $('.delete').click(function(){
  	var id = $(this).data('id');
  	var _token = $('meta[name="csrf-token"]').attr('content');

  	Swal.fire({
	  title: 'Yakin Hapus?',
	  text: "Data tidak dapat dikembalikan lagi!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, hapus!'
		}).then((result) => {
		  if (result.value) {
		   window.location="/admin/komentar/hapus/"+id;
		  }
		});
  });
  $('.cek').click(function(){
  	var id = $(this).data('id');
  	$.ajax({
  		url: "{{route('komentar.berita.view')}}",
  		type: "GET",
  		data:{
  			id: id,
  		},
  		success:function(msg){
  			$('#modalViewLabel').html(msg.judul);
  			$('#modalPenulis').html(msg.penulis);
  			$('#modalCreated').html(msg.created_at);
  			$('#modalFoto').attr('src', msg.src);
  			$('#modalBerita').html(msg.berita);
  		}
  	});
  });
 
 });
</script>
@endsection