@extends('pages.news.master')

@section('header')
<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<!-- summernote -->
<link rel="stylesheet" href="{{asset('admin')}}/plugins/summernote/summernote-bs4.css">
<style type="text/css">
	.select2-selection__rendered {
	    line-height: 53px !important;
	}
	.select2-container .select2-selection--single {
	    height: 52px !important;
	}
  .note-toolbar .note-fontsize .note-btn-group button,
  .note-toolbar .note-para .note-btn-group button {
      line-height: 8px !important;
  }


</style>
@endsection

@section('content')
<div class="content-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card" data-aos="fade-up">
          <div class="card-body">
            @if(Session('thanks'))
              <div class="alert alert-info alert-dismissible fade show" role="alert">
                <strong>Terimakasih !</strong> <br>{{Session('thanks')}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            @endif
        		<div class="aboutus-wrapper">
        			<h1 class="mt-5 text-center mb-5">
                Kirim artikel anda
              </h1>
               <div class="row">
                <div class="col-lg-12 mb-5 mb-sm-2">
                  <form id="postartikel" action="{{route('kirim.artikel')}}" method="POST" enctype="multipart/form-data">
                  	@csrf
                  	<div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <input type="text" class="form-control form-control-sm" id="penulis" name="penulis" value="{{old('penulis')}}" aria-describedby="name" placeholder="Nama Lengkap*" required="required" />
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <input type="email" class="form-control form-control-sm" id="email" name="email" value="{{old('email')}}" aria-describedby="email" placeholder="Email*" required="required" />
                        </div>
                      </div>
                    </div>
                  	<div class="row">
                  		<div class="col-sm-6">
                  			<div class="form-group">      		
								      		<select class="form-control select2bs4" name="cabang_id" style="width: 100%" required="required">
								      			<option></option>      			
								      			@foreach($cabang as $c)
								      			<option value="{{$c->id}}" {{ (old('cabang_id') == $c->id) ? 'selected' : '' }}>{{$c->nama}} ({{$c->wilayah->nama}})</option>
								      			@endforeach
								      		</select>
								      	</div>
                  		</div>
                  		<div class="col-sm-6">
                    		<div class="form-group">
                    			<input type="text" class="form-control form-control-sm" name="telp" id="telp" value="{{old('telp')}}" placeholder="No Telp*" required="required" minlength="9">
                    			<small class="form-text text-muted">Kami tidak akan membagikan nomor anda kepada siapapun.</small>
                    		</div>
                    	</div>
                  	</div>
                  	<div class="row">
                  		<div class="col-sm-12">
                  			<div class="form-group">
                    			<input type="text" class="form-control form-control-sm" name="judul" id="judul" value="{{old('judul')}}" placeholder="Judul Artikel*" required="required">
                    		</div>
                  		</div>
                  	</div>
                  	<div class="row">
                  		<div class="col-sm-12">
                  			<div class="form-group">
                  				<label>Gambar Berita<span class="text-danger"><small>*</small></span></label>
                    			<input type="file" class="form-control form-control-sm" name="foto" id="foto" required="required">
                    		</div>
                  		</div>
                  	</div>
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form-group">
                          <textarea class="form-control form-control-sm textarea" placeholder="Tuliskan pertanyaan anda*" id="berita" name="berita" minlength="10" rows="3">{!! old('berita') !!}</textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-12">
                        {!! captcha_img('flat') !!}
                      </div>
                      <div class="col-sm-6 mt-2">
                        <input type="text" class="form-control form-control-sm" name="captcha" placeholder="Masukkan text captcha" required="required" autocomplete="off">
                      </div>
                      <div class="col-sm-12">
                        <div class="form-group">
                        	<button type="submit" class="btn btn-lg text-light font-weight-bold mt-3" style="background-color: #032a63;"> Kirim Pertanyaan</button>
                        </div>
                      </div>
                    </div>
                  </form>
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
<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>
<!-- Summernote -->
<script src="{{asset('admin')}}/plugins/summernote/summernote-bs4.min.js"></script>
<script src="{{asset('admin')}}/plugins/summernote/lang/summernote-ar-AR.min.js"></script>
<script type="text/javascript">
	$(function(){
    //Initialize Select2 Elements
    $('.select2').select2();    
    $('.select2bs4').select2({
      theme: 'bootstrap4',
      placeholder: "Pilih Cabang",
    	allowClear: true
    });     
    //Add text editor
    $('#berita').summernote({
    	placeholder: 'Tulis artikel anda disini',
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
  });
</script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		$('#postartikel').submit(function(e){
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