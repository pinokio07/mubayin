@extends('layouts.admin.master')

@section('header')
<title>Admin MB | Dashboard</title>
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
          <li class="breadcrumb-item active">Dashboard</li>          
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
          <div class="inner">
            <h3>{{$visitorToday}}</h3>

            <p>Pengunjung hari ini</p>
          </div>
          <div class="icon">
            <i class="ion ion-ios-people"></i>
          </div>          
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
          <div class="inner">
            <h3>{{$visitor}}</h3>

            <p>Total Pengunjung</p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>          
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
          <div class="inner">
            <h3>{{$berita}}</h3>

            <p>Jumlah Berita</p>
          </div>
          <div class="icon">
            <i class="ion ion-android-document"></i>
          </div>          
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
          <div class="inner">
            <h3>{{$testimoni}}</h3>

            <p>Testimoni</p>
          </div>
          <div class="icon">
            <i class="ion ion-android-hangout"></i>
          </div>          
        </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
    <!-- Main row -->
    <div class="row">
      <!-- Left col -->
      <section class="col-lg-7 connectedSortable">
        <!-- Custom tabs (Charts with tabs)-->
        <div class="card">
          <div class="card-header" style="cursor: move;">
            <h3 class="card-title">
              <i class="fas fa-newspaper mr-1"></i>
              Berita
            </h3>
            <div class="card-tools">
              <ul class="nav nav-pills ml-auto">
                <li class="nav-item">
                  <a class="nav-link active" href="#unread" data-toggle="tab">Unread</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#all" data-toggle="tab">Semua</a>
                </li>
              </ul>
            </div>
          </div><!-- /.card-header -->
          <div class="card-body">
            <div class="tab-content p-0">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="unread"
                   style="position: relative; height: 350px;">
                <table class="table table-sm" id="dataUnread" style="width: 100%;">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Pengirim</th>
                      <th>Email</th>
                      <th>Telp</th>
                      <th>Tanggal</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($beritaUnread as $unread)
                      <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$unread->penulis}}</td>
                        <td>{{$unread->email}}</td>
                        <td>{{$unread->telp}}</td>
                        <td>{{$unread->created_at->diffForHumans()}}</td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>                   
              </div>
              <div class="chart tab-pane" id="all" style="position: relative; height: 350px;">
                <table class="table table-sm" id="dataBerita" style="width: 100%;">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Pengirim</th>
                      <th>Email</th>
                      <th>Telp</th>
                      <th>Status</th>
                      <th>Tanggal</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($beritaAll as $ba)
                      <tr @if($ba->status == 'unread') style="background-color:rgba(0,0,0,.05);" @endif>
                        <td>{{$loop->iteration}}</td>
                        <td>{{Str::title($ba->penulis)}}</td>
                        <td>{{$ba->email}}</td>
                        <td>{{$ba->telp}}</td>
                        <td>{{Str::title($ba->status)}}</td>
                        <td>{{$ba->created_at->diffForHumans()}}</td>
                      </tr>
                    @endforeach
                  </tbody>
                </table>                     
              </div>  
            </div>
          </div><!-- /.card-body -->
        </div>
        <!-- /.card -->
      </section>
      <!-- /.Left col -->
      <!-- right col (We are only adding the ID to make the widgets sortable)-->
      <section class="col-lg-5 connectedSortable">

        <!-- Map card -->
        <div class="card">
          <div class="card-header" style="cursor: move;">
            <h3 class="card-title">
              <i class="fas fa-comments mr-1"></i>
              Komentar
            </h3>
            <!-- card tools -->
            <div class="card-tools">              
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
            <!-- /.card-tools -->
          </div>
          <div class="card-body">
            <div class="table-responsive" style="height: 350px; width: 100%;">
              <table class="table table-sm" style="width: 100%;">                
                <tbody>
                  @foreach($komentar as $komen)
                    <tr @if($komen->status == 'unread') style="background-color:rgba(0,0,0,.05);" @endif>
                      <td>{{Str::title($komen->nama)}}</td>
                      <td>{{Str::words($komen->isi, 5)}}</td>
                      <td>{{$komen->created_at->diffForHumans()}}</td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
          <!-- /.card-body-->
          
        </div>
        <!-- /.card -->
      </section>
      <!-- right col -->
    </div>
    <!-- /.row (main row) -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
@endsection

@section('footer')
<script type="text/javascript">
 jQuery(document).ready(function(){
  var domCfg = "<'row'<'col-sm-12 col-md-4'l><'col-sm-12 col-md-8'f>>";

  $('#dataUnread').DataTable({
    responsive:true,
    scrollY: 200,
    stateSave: true
  });
  $('#dataBerita').DataTable({
    responsive:true,
    scrollY: 200,
    stateSave: true
  });  
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
     $($.fn.dataTable.tables(true)).DataTable()
        .columns.adjust();
  });
  $('.connectedSortable').sortable({
    connectWith: ".connectedSortable"
  });
 });
</script>
@endsection