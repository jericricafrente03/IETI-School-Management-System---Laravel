@extends('layouts.backend')
@section('content')
<div class="row">
	<div class="col-sm-10">
		<div class="panel panel-default" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title" >
					<i class="fa fa-dot-circle-o"></i>{{_lang('Teacher Profile')}}
				</div>
			</div>
			<table class="table table-striped table-bordered" width="100%">
				<tbody>
					<tr>
						<td style="text-align: center;" colspan="4"><img width="200px" style="border-radius: 7px;" src="{{ asset('public/uploads/images/'.$teacher->image) }}"></td>
					</tr>
					<tr>
						<td colspan="2">{{_lang('Name')}}</td>
						<td colspan="2">{{$teacher->name}}</td>
					</tr>
					<tr>
						<td>{{_lang('Designation')}}</td>
						<td>{{$teacher->designation}}</td>
						<td>{{_lang('Date Of Birth')}}</td>
						<td>{{$teacher->birthday}}</td>
					</tr>
					<tr>
						<td>{{_lang('Gender')}}</td>
						<td>{{$teacher->gender}}</td>
						<td>{{_lang('Religion')}}</td>
						<td>{{$teacher->religion}}</td>
					</tr>
					<tr>
						<td>{{_lang('Joining Date')}}</td>
						<td>{{$teacher->joining_date}}</td>
						<td>Address</td>
						<td>{{$teacher->address}}</td>
					</tr>
					<tr>
						<td>{{_lang('Phone')}}</td>
						<td>{{$teacher->phone}}</td>
						<td>{{_lang('Email')}}</td>
						<td>{{$teacher->email}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
@endsection