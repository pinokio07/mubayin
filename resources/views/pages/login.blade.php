<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Portal MB | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('/admin')}}/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{asset('/admin')}}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('/admin')}}/dist/css/adminlte.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/toastr/toastr.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>Portal</b> | Mubayyin Baru</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Masukkan Username dan Password</p>
      <form action="/postlogin" method="post">
        @csrf
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Username" id="username" name="username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Password" id="password" name="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <i class="fas fa-eye"></i>
              <i class="fas fa-eye-slash d-none"></i>
            </div>
          </div>
        </div>
        <div class="row">          
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Masuk</button>
          </div>
          <!-- /.col -->
        </div>
      </form>      
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<!-- jQuery -->
<script src="{{asset('/admin')}}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{{asset('/admin')}}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="{{asset('/admin')}}/dist/js/adminlte.min.js"></script>
<!-- Toastr -->
<script src="{{asset('admin')}}/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
  @if(Session::has('sukses'))
    toastr.success("{{Session::get('sukses')}}", "Sukses!", {timeOut: 2000, closeButton: true})
  @elseif(Session::has('thanks'))
    toastr.info("{{Session::get('thanks')}}", "Terimakasih!", {timeOut: 2000, closeButton: true})
  @elseif(Session::has('gagal'))
    toastr.error("{{Session::get('gagal')}}", "Gagal!", {timeOut: 2000, closeButton: true})     
  @endif      
</script>
<script type="text/javascript">
  jQuery(document).ready(function(){
    $('.fa-eye').click(function(){
      $('#password').get(0).type = 'text';      
      $(this).addClass('d-none');
      $('.fa-eye-slash').removeClass('d-none');
    });
    $('.fa-eye-slash').click(function(){
      $('#password').get(0).type = 'password';      
      $(this).addClass('d-none');
      $('.fa-eye').removeClass('d-none');
    });
  });
</script>
</body>
</html>
