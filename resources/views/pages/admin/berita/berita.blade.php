@extends('layouts.admin.master')

@section('header')
<title>Admin MB | Berita</title>
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Daftar Berita</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/dashboard">Dashboard</a></li>
          <li class="breadcrumb-item active">Berita</li>          
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
          <h3 class="card-title">Berita</h3>          
        </div>
        <!-- /.card-header -->
        <div class="card-body mailbox-messages">
          <table class="table table-sm" width="100%" id="dataBerita">
          	<thead>
          		<tr>          			
          			<th>Penulis</th>
          			<th>Kategori</th>          			
          			<th>Judul</th>
          			<th>Status</th>
          			<th>Dibaca</th>
          			<th>Ditulis</th>
          			<th>Aksi</th>
          		</tr>
          	</thead>
          	<tbody>
          		@foreach($berita as $b)
          			<tr >
          				<td>{{Str::title($b->penulis)}}</td>
          				<td>{{Str::title($b->kategori)}}</td>
          				<td><a @if($kategori != '') href="/admin/berita/view?kategori={{$kategori}}&artikel={{$b->id}}" @else href="/admin/berita/view?artikel={{$b->id}}" @endif>{{$b->judul}}</a></td>
          				<td class="@if($b->status == 'rejected') bg-gradient-warning disabled @elseif($b->status == 'unread') bg-gradient-teal @endif">{{Str::title($b->status)}}</td>
          				<td>{{$b->dibaca ?? '0'}} Kali</td>
          				<td>{{$b->created_at->diffForHumans()}}</td>
          				<td>
          					<button class="btn btn-danger btn-xs elevation-1"><i class="fas fa-trash"></i></button>
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
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->
@endsection

@section('footer')
<script type="text/javascript">	
 jQuery(document).ready(function(){
 	$('#dataBerita').DataTable({
    responsive:true,    
    stateSave: true,    
  });  
 });
</script>
@endsection