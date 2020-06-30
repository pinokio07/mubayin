@extends('pages.news.master')

@section('header')

@endsection

@section('content')
<div class="content-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card" data-aos="fade-up">
          <div class="card-body">            
        		<div class="aboutus-wrapper">
        			<h1 class="mt-5 text-center mb-5">
                Tanya kami
              </h1>
               <div class="row">
                <div class="col-lg-12 mb-5 mb-sm-2">
                  <form action="{{route('tanya.kami')}}" method="POST" enctype="multipart/form-data">
                  	@csrf
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form-group">
                          <textarea class="form-control textarea" placeholder="Tuliskan pertanyaan anda *" id="pertanyaan" name="pertanyaan" required="required" minlength="10">{{ old('pertanyaan') }}</textarea>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <input type="text" class="form-control" id="nama" name="nama" value="{{ old('nama') }}" aria-describedby="name" placeholder="Kosongkan untuk Anonymous"/>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}" aria-describedby="email" placeholder="Email untuk mengirimkan jawaban *"/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                    	<div class="col-sm-6">
                    		<div class="form-group">
                    			<input type="text" class="form-control" name="telp" id="telp" value="{{ old('telp') }}" placeholder="No Telp *" required="required" minlength="9">
                    			<small class="form-text text-muted">Kami tidak akan membagikan nomor anda kepada siapapun.</small>
                    		</div>
                    	</div>
                      <div class="col-sm-6">
                        <div class="row">
                          <div class="col-sm-7">
                             <input type="text" class="form-control form-control-sm" name="captcha" placeholder="Masukkan text captcha" required="required" autocomplete="off">
                          </div>
                          <div class="col-sm-5 mt-2">
                            {!! captcha_img('flat') !!}                           
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
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

@endsection