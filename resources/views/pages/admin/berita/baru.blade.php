@extends('layouts.admin.master')

@section('header')
<title>Admin MB | Tulis Berita</title>
<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<!-- summernote -->
<link rel="stylesheet" href="{{asset('admin')}}/plugins/summernote/summernote-bs4.css">
<link rel="stylesheet" type="text/css" href="{{asset('/admin/editable/css/bootstrap-editable.css')}}">
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Dashboard</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
          <li class="breadcrumb-item"><a href="{{url()->previous()}}">Berita</a></li>
          <li class="breadcrumb-item active">Baru</li>          
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="row">    
    <div class="col-md-12">
      <div class="card card-primary card-outline">
        <div class="card-header">
          <h3 class="card-title">Tulis Artikel</h3>
        </div>
        <!-- /.card-header -->
        <form class="form-horizontal" id="formTambah" action="/admin/berita/post" method="POST" enctype="multipart/form-data">
        	@csrf
        	<div class="card-body">
        		<div class="form-group row">
              <label for="judul" class="col-sm-2 col-form-label">Judul Berita</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="judul" name="judul" placeholder="Tuliskan judul berita" required="required">
              </div>
            </div>
            <div class="row">
            	<div class="col-md-6">
            		<div class="form-group row">
		            	<label for="penulis" class="col-sm-4 col-form-label">Penulis</label>
		            	<div class="col-sm-8">
		            		<input type="text" class="form-control" name="penulis" id="penulis" placeholder="Tuliskan nama Penulis" required="required">
		            	</div>
		            </div>
            	</div>
            	<div class="col-md-6">
            		<div class="form-group row">
		            	<label for="email" class="col-sm-4 col-form-label">Email Penulis</label>
		            	<div class="col-sm-8">
		            		<input type="email" class="form-control" name="email" id="email" placeholder="Email Penulis" required="required">
		            	</div>
		            </div>
            	</div>
            </div>
            <div class="row">
            	<div class="col-md-6">
            		<div class="form-group row">
		            	<label for="kategori" class="col-sm-4 col-form-label">Kategori</label>
		            	<div class="col-sm-8">
		            		<select class="custom-select" name="kategori" id="kategori" required="required">
		            			<option selected="selected" disabled="disabled">Pilih...</option>
		                	<option value="kegiatan">Kegiatan</option>
		                	<option value="khutbah">Khutbah</option>
		                	<option value="pembaca">Pembaca</option>
		                </select>
		            	</div>
		            </div>
            	</div>
            	<div class="col-md-6">
            		<div class="form-group row">
		            	<label for="cabang_id" class="col-sm-4 col-form-label">Cabang</label>
		            	<div class="col-sm-8">
		            		<select class="select2bs4" id="cabang_id" name="cabang_id" style="width: 100%;">
		            			<option></option>
		            			@foreach($cabang as $c)
		            			<option value="{{$c->id}}">{{$c->nama}} ({{$c->wilayah->nama}})</option>
		            			@endforeach
		            		</select>
		            	</div>
		            </div>
            	</div>
            </div>
            <div class="form-group row">
              <label for="berita" class="col-sm-2 col-form-label">Isi Berita</label>
              <div class="col-sm-10">
                <textarea class="form-control form-control-sm summernote" name="berita" id="berita"></textarea>
              </div>
            </div>
            <div class="form-group row">
              <label for="berita" class="col-sm-2 col-form-label">Foto Berita</label>
              <div class="col-sm-6">
              	<div class="row">
              		<div class="col-sm-6 pb-2">
              			<img src="#" class="img-fluid" id="fotoPreview" width="100%" height="100%">
              		</div>
              		<div class="col-sm-12">
              			<input type="file" class="form-control" name="foto" id="foto" accept="image/*" required="required" onchange="document.getElementById('fotoPreview').src = window.URL.createObjectURL(this.files[0])">
              		</div>
              	</div>
              </div>
            </div>
        	</div>
        	<div class="card-footer">
        		<button class="btn btn-success elevation-1"><i class="fas fa-save"></i> Simpan</button>
        	</div>
        </form>        
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
<script src="{{asset('admin')}}/plugins/summernote/lang/summernote-ar-AR.min.js"></script>
<script src="{{asset('/admin/editable/js/bootstrap-editable.js')}}"></script>
<script type="text/javascript"> 
 jQuery(document).ready(function(){
 	//Initialize Select2 Elements
  $('.select2').select2();    
  $('.select2bs4').select2({
    theme: 'bootstrap4',
    placeholder: "Pilih Cabang",
  	allowClear: true
  });  	
	//Add text editor
  $('.summernote').summernote({    	
  	minHeight: 150,
  	placeholder: 'Tuliskan isi berita',
  	toolbar: [
		  ['style', ['style']],
		  ['font', ['bold', 'underline', 'clear', 'superscript', 'subscript']],
		  ['fontname', ['fontname']],
		  ['color', ['color']],
		  ['para', ['ul', 'ol', 'paragraph', 'height']],
		  ['table', ['table', 'hr']],
		  ['insert', ['link']],
		  ['view', ['fullscreen', 'codeview', 'help', 'undo', 'redo']],		 
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
  $('#formTambah').submit(function(e){
			if ($('#berita').summernote('isEmpty')) {
				e.preventDefault();
				alert('Harap isi konten berita.');
			} else {
				$(this).submit();
			}
		});
 });
</script>
@endsection