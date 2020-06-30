<nav class="main-header navbar navbar-expand navbar-dark navbar-teal">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
		</li>		
	</ul>
	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<li class="nav-item">
			<span class="nav-link">{{Str::title(auth()->user()->username)}}</span>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/profile">
				<i class="fas fa-user-cog"></i>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/logout" id="logout">
				<i class="fas fa-sign-out-alt"></i>
			</a>
		</li>
	</ul>
</nav>