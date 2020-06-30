 <aside class="main-sidebar sidebar-light-teal elevation-4">
 	<!-- Brand Logo -->
 	<a href="/dashboard" class="brand-link navbar-teal">
 		<img src="{{asset('/images/favicon.png')}}" alt="Logo" class="brand-image img-circle elevation-3"
 		style="opacity: .8">
 		<span class="brand-text font-weight-light">Admin MB</span>
 	</a>
 	<!-- Sidebar -->
 	<div class="sidebar">
 		<!-- Sidebar user panel (optional) -->
 		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
 			<div class="image">
 				<img src="{{auth()->user()->getAvatar()}}" class="img-circle elevation-2" alt="User Image">
 			</div>
 			<div class="info">
 				<a href="#" class="d-block">{{Str::title(auth()->user()->username)}}</a>
 			</div>
 		</div>

 		<!-- Sidebar Menu -->
 		<nav class="mt-2">
 			<ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-compact nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
          	with font-awesome or any other icon font library 
          	<li class="nav-item has-treeview menu-open">
          		<a href="#" class="nav-link active">
          			<i class="nav-icon fas fa-tachometer-alt"></i>
          			<p>
          				Dashboard
          				<i class="right fas fa-angle-left"></i>
          			</p>
          		</a>
          		<ul class="nav nav-treeview">
          			<li class="nav-item">
          				<a href="./index.html" class="nav-link active">
          					<i class="far fa-circle nav-icon"></i>
          					<p>Dashboard v1</p>
          				</a>
          			</li>          			
          		</ul>
          	</li>
            -->
          	<li class="nav-item">
          		<a href="/admin/berita" class="nav-link">
          			<i class="nav-icon fas fa-newspaper"></i>
          			<p>
          				Berita
                  @if(unreadBerita() > 0)
          				<span class="right badge badge-success">{{unreadBerita()}}</span>
                  @endif
          			</p>
          		</a>
          	</li>
            <li class="nav-item">
              <a href="/admin/komentar" class="nav-link">
                <i class="nav-icon fas fa-comments"></i>
                <p>
                  Komentar
                  @if(unreadKomentar() > 0)
                  <span class="right badge badge-info">{{unreadKomentar()}}</span>
                  @endif
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/pertanyaan" class="nav-link">
                <i class="nav-icon fas fa-question"></i>
                <p>
                  Pertanyaan
                  @if(unreadPertanyaan() > 0 )
                  <span class="right badge badge-warning">{{unreadPertanyaan()}}</span>
                  @endif
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/testimoni" class="nav-link">
                <i class="nav-icon fas fa-comment-alt"></i>
                <p>
                  Testimoni
                  @if(unreadTestimoni() > 0)
                  <span class="right badge badge-danger">{{unreadTestimoni()}}</span>
                  @endif
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/buku" class="nav-link">
                <i class="nav-icon fas fa-book"></i>
                <p>
                  Buku                  
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/foto" class="nav-link">
                <i class="nav-icon fas fa-images"></i>
                <p>
                  Foto Kegiatan                  
                </p>
              </a>
            </li>           	
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>