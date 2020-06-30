<!DOCTYPE html>
<html lang="zxx">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Portal Mubayin Baru</title>    
    <!--Csrf Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="{{asset('berita')}}/assets/vendors/mdi/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="{{asset('berita')}}/assets/vendors/aos/dist/aos.css/aos.css" />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400&display=swap" rel="stylesheet">
    <!-- End plugin css for this page -->
    <link rel="shortcut icon" href="{{asset('/images/favicon.png')}}"/>
    <!-- inject:css -->
    <link rel="stylesheet" href="{{asset('berita')}}/assets/css/style.css">
    <!-- endinject -->
    <!-- DataTables -->
    <link rel="stylesheet" href="{{asset('admin')}}/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="{{asset('admin')}}/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="{{asset('admin')}}/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="{{asset('admin')}}/plugins/toastr/toastr.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="{{asset('admin')}}/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">  
    <style type="text/css">
      .transparent{opacity: 0.9;}
    </style>
    @yield('header')
  </head>

  <body>
    <div class="container-scroller">
      <div class="main-panel">
        <!-- partial:partials/_navbar.html -->
        <header id="header">
          <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light">              
              <div class="navbar-bottom pt-4">
            		<div class="d-flex flex-column justify-content-center align-items-center row">
              		<img src="{{asset('images/bismillah.png')}}" style="width: 150px;height: 30px;">
              		<p class="text-white artinya" style="font-size: 10px;text-transform: uppercase;">Aku baca dengan nama Allah, Maha Pemurah, Maha Penyayang.</p>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                  <div>
                    <a class="navbar-brand" href="/">
                    	<img src="{{asset('/')}}images/logo3.png" alt=""/>
                    </a>
                  </div>
                  <div>
                    <button class="navbar-toggler" type="button" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="navbar-collapse justify-content-center collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav d-lg-flex justify-content-between align-items-center">
                        <li>
                          <button class="navbar-close">
                            <i class="mdi mdi-close"></i>
                          </button>
                        </li>                        
                        <li class="nav-item">
                          <a class="nav-link" href="/kegiatan">Kegiatan</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/khutbah">Khutbah</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/baiat">Bai'at</a>
                        </li>                        
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarGallery" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gallery
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarGallery">
                            <a class="dropdown-item" href="/gallery/buku">Buku</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/gallery/foto">Foto</a>
                          </div>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/tanya">Tanya Kami</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/testimoni">Testimoni</a>
                        </li> 
                        <li class="nav-item">
                          <a class="nav-link" href="/kirim">Kirim Artikel</a>
                        </li>                       
                      </ul>
                    </div>
                  </div>
                  <ul class="social-media">
                  	<li>
                      <a href="https://ahmadiyah.id/" target="_blank">
                        <i class="mdi mdi-home"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="mdi mdi-facebook"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="mdi mdi-youtube"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="mdi mdi-twitter"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </nav>
          </div>
        </header>
        @if(Session('thanks'))        
        <div class="col-lg-12 align-items-center justify-content-between">
          <div class="alert alert-info alert-dismissible my-2 fade show" role="alert">
            <strong>Terimakasih !</strong> <br>{{Session('thanks')}}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>   
        @elseif(Session('sukses'))
        <div class="col-lg-12 align-items-center justify-content-between">
          <div class="alert alert-info alert-dismissible my-2 fade show" role="alert">
            <strong>Selamat !</strong> <br>{{Session('sukses')}}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
        @elseif(Session('gagal'))        
        <div class="col-lg-12 align-items-center justify-content-between">
          <div class="alert alert-danger alert-dismissible my-2 fade show" role="alert">
            <strong>Maaf !</strong> <br>{{Session('gagal')}}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        </div>
        @endif
        @yield('content')
        <!-- partial:partials/_footer.html -->
        <footer>
          <div class="footer-top">
            <div class="container">
              <div class="row">
                <div class="col-sm-5">
                  <img src="{{asset('/')}}images/logo.svg" class="footer-logo" alt="" />
                  <h5 class="font-weight-normal mt-4 mb-5">
                    Newspaper is your news, entertainment, music fashion website. We
                    provide you with the latest breaking news and videos straight from
                    the entertainment industry.
                  </h5>
                  <ul class="social-media mb-3">
                    <li>
                      <a href="#">
                        <i class="mdi mdi-facebook"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="mdi mdi-youtube"></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="mdi mdi-twitter"></i>
                      </a>
                    </li>
                  </ul>
                </div>
                <div class="col-sm-4">
                  <h3 class="font-weight-bold mb-3">RECENT POSTS</h3>
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="footer-border-bottom pb-2">
                        <div class="row">
                          <div class="col-3">
                            <img
                              src="{{asset('/')}}images/dashboard/home_1.jpg"
                              alt="thumb"
                              class="img-fluid"
                            />
                          </div>
                          <div class="col-9">
                            <h5 class="font-weight-600">
                              Cotton import from USA to soar was American traders
                              predict
                            </h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="footer-border-bottom pb-2 pt-2">
                        <div class="row">
                          <div class="col-3">
                            <img
                              src="{{asset('/')}}images/dashboard/home_2.jpg"
                              alt="thumb"
                              class="img-fluid"
                            />
                          </div>
                          <div class="col-9">
                            <h5 class="font-weight-600">
                              Cotton import from USA to soar was American traders
                              predict
                            </h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                      <div>
                        <div class="row">
                          <div class="col-3">
                            <img
                              src="{{asset('/')}}images/dashboard/home_3.jpg"
                              alt="thumb"
                              class="img-fluid"
                            />
                          </div>
                          <div class="col-9">
                            <h5 class="font-weight-600 mb-3">
                              Cotton import from USA to soar was American traders
                              predict
                            </h5>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-3">
                  <h3 class="font-weight-bold mb-3">CATEGORIES</h3>
                  <div class="footer-border-bottom pb-2">
                    <div class="d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 font-weight-600">Magazine</h5>
                      <div class="count">1</div>
                    </div>
                  </div>
                  <div class="footer-border-bottom pb-2 pt-2">
                    <div class="d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 font-weight-600">Business</h5>
                      <div class="count">1</div>
                    </div>
                  </div>
                  <div class="footer-border-bottom pb-2 pt-2">
                    <div class="d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 font-weight-600">Sports</h5>
                      <div class="count">1</div>
                    </div>
                  </div>
                  <div class="footer-border-bottom pb-2 pt-2">
                    <div class="d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 font-weight-600">Arts</h5>
                      <div class="count">1</div>
                    </div>
                  </div>
                  <div class="pt-2">
                    <div class="d-flex justify-content-between align-items-center">
                      <h5 class="mb-0 font-weight-600">Politics</h5>
                      <div class="count">1</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="footer-bottom">
            <div class="container">
              <div class="row">
                <div class="col-sm-12">
                  <div class="d-sm-flex justify-content-between align-items-center">
                    <div class="fs-14 font-weight-600">
                      © 2020 @ <a href="https://www.bootstrapdash.com/" target="_blank" class="text-white"> BootstrapDash</a>. All rights reserved.
                    </div>
                    <div class="fs-14 font-weight-600">
                      Handcrafted by <a href="https://www.bootstrapdash.com/" target="_blank" class="text-white">BootstrapDash</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </footer>

        <!-- partial -->
      </div>
    </div>
    <!-- inject:js -->
    <script src="{{asset('berita')}}/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <script src="{{asset('berita')}}/assets/vendors/aos/dist/aos.js/aos.js"></script>
    <!-- End plugin js for this page -->
    <!-- Custom js for this page-->
    <script src="{{asset('berita')}}/assets/js/demo.js"></script>
    <script src="{{asset('berita')}}/assets/js/jquery.easeScroll.js"></script>
    <!-- End custom js for this page-->
    <!-- DataTables -->
    <script src="{{asset('admin')}}/plugins/datatables/jquery.dataTables.js"></script>
    <script src="{{asset('admin')}}/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
    <!-- Select2 -->
    <script src="{{asset('admin')}}/plugins/select2/js/select2.full.min.js"></script>
    <!-- Toastr -->
    <script src="{{asset('admin')}}/plugins/toastr/toastr.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="{{asset('admin')}}/plugins/sweetalert2/sweetalert2.min.js"></script>    
    <script type="text/javascript">
      @if(Session::has('sukses'))
        toastr.success("{{Session::get('sukses')}}", "Sukses!", {timeOut: 2000, closeButton: true})
      @elseif(Session::has('thanks'))
        toastr.info("{{Session::get('thanks')}}", "Terimakasih!", {timeOut: 2000, closeButton: true})
      @elseif(Session::has('gagal'))
        toastr.error("{{Session::get('gagal')}}", "Gagal!", {timeOut: 2000, closeButton: true})     
      @endif      
    </script>
    @yield('footer')
  </body>
</html>
