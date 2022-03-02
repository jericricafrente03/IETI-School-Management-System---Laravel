@extends('layouts.backend')
@section('content')
<div class="row">
	<div class="col-sm-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title" >
					{{_lang('My Profile')}}
				</div>
			</div>
			
			<table class="table table-striped table-bordered" width="100%">
				<tbody>
					<tr>
						<td style="text-align: center;" colspan="4"><img width="200px" style="border-radius: 7px;" src="{{ asset('public/uploads/images/'.$student->image) }}"></td>
					</tr>
					<tr>
						<td colspan="2">{{_lang('Name')}}</td>
						<td colspan="2">{{$student->first_name." ".$student->last_name}}</td>
					</tr>
					<tr>
						<td>{{_lang('Guardian')}}</td>
						<td>{{$student->parent_name}}</td>
						<td>{{_lang('Date Of Birth')}}</td>
						<td>{{$student->birthday}}</td>
					</tr>
					<tr>
						<td>{{_lang('Gender')}}</td>
						<td>{{$student->gender}}</td>
						<td>{{_lang('Blood Group')}}</td>
						<td>{{$student->blood_group}}</td>
					</tr>
					<tr>
						<td>{{_lang('Religion')}}</td>
						<td>{{$student->religion}}</td>
						<td>Address</td>
						<td>{{$student->address}}</td>
					</tr>
					<tr>
						<td>{{_lang('Phone')}}</td>
						<td>{{$student->phone}}</td>
						<td>{{_lang('Email')}}</td>
						<td>{{$student->email}}</td>
					</tr>
					<tr>
						<td>{{_lang('State')}}</td>
						<td>{{$student->state}}</td>
						<td>{{_lang('Country')}}</td>
						<td>{{$student->country}}</td>
					</tr>
					<tr>
						<td>{{_lang('Class')}}</td>
						<td>{{$student->class_name}}</td>
						<td>{{_lang('Section')}}</td>
						<td>{{$student->section_name}}</td>
					</tr>
					<tr>
						<td>{{_lang('Register No')}}</td>
						<td>{{$student->register_no}}</td>
						<td>{{_lang('Roll')}}</td>
						<td>{{$student->roll}}</td>
					</tr>
					<tr>
						<td>{{_lang('Group')}}</td>
						<td>{{$student->group}}</td>
						<td>{{_lang('Optional Subject')}}</td>
						<td>{{$student->optional_subject}}</td>
					</tr>
					<tr>
						<td>{{_lang('Activities')}}</td>
						<td>{{$student->activities}}</td>
						<td>{{_lang('Remarks')}}</td>
						<td>{{$student->remarks}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
@endsection