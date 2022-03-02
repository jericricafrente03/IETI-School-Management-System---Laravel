<ul class="nav metismenu" id="menu">
	<li @if(Request::is('dashboard')) class="active" @endif>
		<a href="{{route('dashboard')}}">
			<i class="fa fa-desktop"></i>
			{{ _lang('Dashboard') }}
		</a>
	</li>
	
	@include('layouts.menus.menus')
</ul>	