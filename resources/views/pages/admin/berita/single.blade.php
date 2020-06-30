@extends('layouts.admin.master')

@section('header')
<title>Admin MB | Lihat Berita</title>
<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<!-- summernote -->
<link rel="stylesheet" href="{{asset('admin')}}/plugins/summernote/summernote-bs4.css">
<link rel="stylesheet" type="text/css" href="{{asset('/admin/editable/css/bootstrap-editable.css')}}">
<style type="text/css">
	/* Make inline editables take the full width of their parents */
	.editable-container.editable-inline,
	.editable-container.editable-inline .control-group.form-group,
	.editable-container.editable-inline .control-group.form-group .editable-input,
	.editable-container.editable-inline .control-group.form-group .editable-input textarea,
	.editable-container.editable-inline .control-group.form-group .editable-input select,
	.editable-container.editable-inline .control-group.form-group .editable-input input:not([type=radio]):not([type=checkbox]):not([type=submit])
	{
	    width: 100% !important;
	    display: block;
	}
</style>
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Lihat Berita</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
          @if($kategori == '')
          <li class="breadcrumb-item"><a href="/admin/berita">Berita</a></li>
          @else
          <li class="breadcrumb-item"><a href="/admin/berita?kategori={{$kategori}}">Berita</a></li>
          @endif
          <li class="breadcrumb-item active">View</li>          
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-2">
      <a href="/admin/berita/new" class="btn btn-primary btn-block elevation-1 mb-3">Buat Berita</a>
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Jenis Berita</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
            </button>
          </div>
        </div>
        <div class="card-body p-0">
          <ul class="nav nav-pills flex-column">
          	<li class="nav-item active">
              <a href="/admin/berita" class="nav-link">
                <i class="fas fa-sync"></i> Semua                
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/berita?kategori=kegiatan" class="nav-link">
                <i class="fas fa-copy"></i> Kegiatan
                @if($unreadKegiatan != null || $unreadKegiatan > 0)
                <span class="badge bg-success float-right">{{$unreadKegiatan}}</span>
                @endif
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/berita?kategori=khutbah" class="nav-link">
                <i class="fas fa-volume-up"></i> Khutbah
                @if($unreadKhutbah != null || $unreadKhutbah > 0)
                <span class="badge bg-info float-right">{{$unreadKhutbah}}</span>
                @endif
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/berita?kategori=pembaca" class="nav-link">
                <i class="fas fa-clipboard"></i> Pembaca
                @if($unreadPembaca != null || $unreadPembaca > 0)
                <span class="badge bg-warning float-right">{{$unreadPembaca}}</span>
                @endif
              </a>
            </li>            
          </ul>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->      
    </div>
    <!-- /.col -->
    <div class="col-md-10">
      <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">Baca Artikel</h3>               
              <div class="card-tools">
                <a href="@if($previous != null) /admin/berita/view?kategori={{$kategori}}&artikel={{$previous}} @else # @endif" class="btn btn-tool" data-toggle="tooltip" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="@if($next != null) /admin/berita/view?kategori={{$kategori}}&artikel={{$next}} @else # @endif" class="btn btn-tool" data-toggle="tooltip" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="mailbox-read-info">
                <h5><a href="#" class="editable text-dark text-decoration-none" data-type="text" data-pk="{{$berita->id}}" data-url="/api/editjudul" data-title="Edit Judul">{{Str::title($berita->judul)}}</a></h5>
                <hr class="w-100">
                <h6>Penulis: {{Str::title($berita->penulis)}}
                	@if($berita->status == 'rejected')
                	<span class="right badge badge-danger">Rejected</span>
                	@elseif($berita->status == 'active')
                	<span class="right badge badge-success">Published</span>
                	@elseif($berita->status == 'inactive' || $berita->status == 'read')
                	<span class="right badge badge-secondary">Unpublished</span>
                	@endif
                  <div class="row text-right">
                    <div class="col-sm-12">
                      <span class="mailbox-read-time"> Ditulis: {{$berita->created_at->diffForHumans()}}</span>
                    </div>
                    <div class="col-sm-12">
                      <span class="mailbox-read-time"> Diedit: <span id="dieditPada">{{$berita->updated_at->diffForHumans()}}</span></span>
                    </div>
                  </div>
                </h6>
              </div>
              <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center">
              	<div class="row">
              		<div class="col-sm-6">
              			<div class="row">
              				<div class="col-sm-4 text-left">
              					<label>Kategori Berita</label>
              				</div>
              				<div class="col-sm-8">
              					<select class="custom-select custom-select-sm" name="kategori" id="kategori" data-id="{{$berita->id}}">
				                	<option value="kegiatan" @if($berita->kategori == 'kegiatan') selected @endif>Kegiatan</option>
				                	<option value="khutbah"  @if($berita->kategori == 'khutbah') selected @endif>Khutbah</option>
				                	<option value="pembaca"  @if($berita->kategori == 'pembaca') selected @endif>Pembaca</option>
				                </select>
              				</div>
              			</div>
              		</div>
              		<div class="col-sm-6 text-right mt-1 mt-md-0">
              			<div class="btn-group">
		                  <button type="button" class="btn btn-danger btn-sm delete" data-toggle="tooltip" data-container="body" data-id="{{$berita->id}}" title="Delete">
		                    <i class="far fa-trash-alt"></i></button>
		                  <button type="button" class="btn btn-default btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$berita->id}}" data-status="inactive" title="Unpublish"><i class="fas fa-eye-slash"></i></button>
		                  <button type="button" class="btn btn-success btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$berita->id}}" data-status="active" title="Publish">
		                    <i class="fas fa-check"></i></button>                  
		                  <button type="button" class="btn btn-warning btn-sm stat" data-toggle="tooltip" data-container="body" data-id="{{$berita->id}}" data-status="rejected" title="Rejected">
		                    <i class="fas fa-times"></i></button>
		                </div>               
		                <!-- /.btn-group -->
              		</div>
              	</div>         
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
              	<div class="row pb-2">
              		<div class="col-sm-4">
              			
              		</div>
              	</div>
              	<form action="/api/editberita" method="POST" target="sp" enctype="multipart/form-data">
              		@csrf
              		<input type="hidden" name="id" value="{{$berita->id}}">
              		<textarea class="form-control form-control-sm summernote" name="berita">{!!$berita->berita!!}</textarea>
              	</form>
              </div>
              <iframe id="sp" name="sp" class="d-none"></iframe>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
            	<div class="card" style="width: 18rem;">
							  <img class="card-img-top" id="fotoPreview" src="{{$berita->getFoto()}}" alt="Card image cap">
							  <div class="card-body">
                  <form id="gantiGambar" action="{{route('berita.ganti.foto')}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id_berita" value="{{$berita->id}}">
                  <div class="row">
                    <div class="col-sm-12">
                      <small class="text-danger">Klik nama foto untuk ganti</small>
                    </div>
                    <div class="col-sm-12">
                      <h5 class="card-title" data-toggle="tooltip" title="Klik untuk ganti gambar"><label for="foto"><i class="fas fa-paperclip"></i> <span id="namaFoto">{{$berita->foto ?? 'Tidak ada foto'}}</span></label></h5>
                      <input type="file" id="foto" name="foto" class="d-none" accept="image/*" onchange="document.getElementById('fotoPreview').src = window.URL.createObjectURL(this.files[0])">
                    </div>
                    <div class="col-sm-12">
                      <a href="{{$berita->getFoto()}}" class="btn btn-default btn-sm float-right" data-toggle="tooltip" title="Download" download="download"><i class="fas fa-cloud-download-alt"></i></a>
                      <button type="submit" id="btnSave" class="btn btn-default btn-sm float-right d-none" data-toggle="tooltip" title="Simpan"><i class="fas fa-save"></i></button>
                    </div>
                  </div>
                  </form>
							  </div>
							</div>              
            </div>
            <!-- /.card-footer -->
            <div class="card-footer">
            </div>
            <!-- /.card-footer -->
          </div>
          <!-- /.card -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->
@endsection

@section('footer')
<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
<!-- Summernote -->
<script src="{{asset('admin')}}/plugins/summernote/summernote-bs4.min.js"></script>
<script src="{{asset('admin')}}/plugins/summernote/summernote-save-button.js"></script>
<script src="{{asset('admin')}}/plugins/summernote/lang/summernote-ar-AR.min.js"></script>
<script src="{{asset('/admin/editable/js/bootstrap-editable.js')}}"></script>
<script type="text/javascript"> 
 jQuery(document).ready(function(){
  var _token = $('meta[name="csrf-token"]').attr('content');
 	//Editable Judul
 	$('.editable').editable({
		mode: 'inline',
		onblur: 'submit', 		
		savenochange : false,
		showbuttons: false,
		inputclass: 'form-control',
		validate: function(value) {
      if(value == null) {
          return ' Tidak boleh kosong.';
      }
      if (value.length < 8) {
      	return ' Minimal 8 huruf.';
      }
  	},  	
	});
	//Add text editor
  $('.summernote').summernote({    	
  	minHeight: 150,
  	toolbar: [
		  ['style', ['style']],
		  ['font', ['bold', 'underline', 'clear', 'superscript', 'subscript']],
		  ['fontname', ['fontname']],
		  ['color', ['color']],
		  ['para', ['ul', 'ol', 'paragraph', 'height']],
		  ['table', ['table', 'hr']],
		  ['insert', ['link']],
		  ['view', ['fullscreen', 'codeview', 'help', 'undo', 'redo']],
		  ['save', ['save']], // The button
		],			
		disableDragAndDrop: true,
		shortcuts: false,
		spellCheck: false,
		disableGrammar: true,
		codemirror: { // codemirror options
	    theme: 'monokai'
	  },	  
		callbacks: {
      // Clear all formatting of the pasted text
      onPaste: function (e) {
        var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
        e.preventDefault();
        setTimeout( function(){
          document.execCommand( 'insertText', false, bufferText );
        }, 10 );
      }
    },    
  });
  $.extend(true,$.summernote.lang, {
    'ar-AR': { /* Arabic Language */
      examplePlugin: {
        exampleText: '',
        dialogTitle: '',
        okButton: ''
      }
    }
  });
  //Edit Kategori
  $('#kategori').change(function(){
  	var id = $(this).data('id');
    var kategori = $(this).val();   
    
    $.ajax({
      url: "{{route('berita.ganti.kategori')}}",
      type: "POST",
      data:{
        _token: _token,
        id: id,
        kategori: kategori,
      },
      success:function(){

      }
    });
  });
  //Set Status
  $('.stat').click(function(){
  	var id = $(this).data('id');
  	var status = $(this).data('status'); 	

  	Swal.fire({
	  title: 'Ganti Status?',
	  text: "Status berita akan diganti!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Ya, ganti!'
		}).then((result) => {
		  if (result.value) {
		   $.ajax({
		   	url: "{{route('berita.ganti.status')}}",
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
  	
  	Swal.fire({
	  title: 'Yakin Hapus?',
	  text: "Berita dan semua komentar akan dihapus!",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'Yes, hapus!'
		}).then((result) => {
		  if (result.value) {
		   window.location="/admin/berita/hapus/"+id;
		  }
		});
  });  
  //Change Label File
  $('#foto').change(function(e){
    var name = e.target.files[0].name;
    $('#namaFoto').html(name);
    $('#btnSave').removeClass('d-none');
  });
  //Proses Ganti Foto
  $('#gantiGambar').on('submit', (function(e){
      e.preventDefault();    
      var action = $(this).attr('action');
  
      Swal.fire({
      title: 'Ganti Gambar?',
      text: "Gambar yang lama akan dihapus!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, ganti!'
      }).then((result) => {
        if (result.value) {
        $.ajax({
          type: 'POST',
          url: action,
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData: false,          
          success:function(msg){
            $("#namaFoto").html(msg.nama);
            $('#btnSave').addClass('d-none');
          }
        })
        }
      });
    }));
 });
</script>
@endsection