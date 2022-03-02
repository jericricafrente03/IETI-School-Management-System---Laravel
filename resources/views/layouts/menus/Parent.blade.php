<ul class="nav metismenu" id="menu">
	<li @if(Request::is('dashboard')) class="active" @endif>
		<a href="{{ route('dashboard') }}">
			<i class="fa fa-desktop"></i>
			{{ _lang('Dashboard') }}
		</a>
	</li>
	
	<li @if(Request::is('parent/my_profile')) class="active" @endif>
		<a href="{{ url('parent/my_profile') }}">
			<i class="fa fa-user-circle-o"></i>
			{{ _lang('My Profile') }}
		</a>
	</li>
	
	{!! get_children('My Children', 'parent/my_children', 'fa fa-users') !!}
	
	@include('layouts.menus.menus')
</ul>	