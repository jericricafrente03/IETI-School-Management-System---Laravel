<ul class="nav metismenu" id="menu">
	<li @if(Request::is('dashboard')) class="active" @endif>
		<a href="{{ route('dashboard') }}">
			<i class="fa fa-desktop"></i>
			{{ _lang('Dashboard') }}
		</a>
	</li>
	
	<li @if(Request::is('teacher/my_profile')) class="active" @endif>
		<a href="{{ url('teacher/my_profile') }}">
			<i class="fa fa-user-circle-o"></i>
			{{ _lang('My Profile') }}
		</a>
	</li>
	
	<li @if(Request::is('teacher/class_schedule')) class="active" @endif>
		<a href="{{ url('teacher/class_schedule') }}">
			<i class="fa fa-calendar"></i>
			{{ _lang('Class Schedule') }}
		</a>
	</li>
	
	<li @if(Request::is('teacher/mark_register')) class="active" @endif>
		<a href="{{ url('teacher/mark_register') }}">
		    <i class="fa fa-balance-scale"></i>
			{{ _lang('Mark Register') }}
		</a>
    </li>
	
	<li @if(Request::is('teacher/assignments')) class="active" @endif>
		<a href="{{ url('teacher/assignments') }}">
		    <i class="fa fa-hourglass-half"></i>
			{{ _lang('Assignments') }}
		</a>
    </li>
	
	@include('layouts.menus.menus')
</ul>	