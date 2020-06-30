<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--Csrf Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="shortcut icon" href="{{asset('/images/favicon.png')}}"/>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('/admin')}}/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('/admin')}}/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{asset('/admin')}}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">  
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- DataTables -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/toastr/toastr.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  @yield('header')
</head>
<body class="hold-transition sidebar-mini layout-fixed text-sm">
<div class="wrapper">

  <!-- Navbar -->
  @include('layouts.admin._include._navbar')
  <!-- /.navbar -->
	@include('layouts.admin._include._sidebar')
  <!-- Main Sidebar Container -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.2
    </div>
  </footer>  
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{asset('/admin')}}/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{asset('/admin')}}/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{asset('/admin')}}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="{{asset('/admin')}}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="{{asset('/admin')}}/dist/js/adminlte.js"></script>
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
