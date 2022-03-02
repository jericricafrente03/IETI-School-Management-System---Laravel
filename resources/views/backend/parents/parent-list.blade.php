@extends('layouts.backend')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="header">
				<div class="col-md-6">
					<h4 class="title">{{_lang('Parents List')}}</h4>
				</div>
				<div class="col-md-6" style="text-align: right;">
					<a href="{{route('parents.create')}}" class="btn btn-info btn-sm">{{_lang('Add New Parent')}}</a>
				</div>
			</div>
			<div class="content">
				<table class="table table-bordered data-table">
					<thead>
						<th>{{ _lang('Profile') }}</th>
						<th>{{ _lang('Name') }}</th>
						<th>{{ _lang('Student') }}</th>
						<th>{{ _lang('Email') }}</th>
						<th>{{ _lang('Action') }}</th>
					</thead>
					<tbody>
						@foreach($parents as $data)
						<tr>
							<td><img src="{{ asset('public/uploads/images/'.$data->image) }}" width="50px" alt=""></td>
							<td>{{ $data->name }}</td>
							<td>{{ $data->first_name." ".$data->last_name }}</td>
							<td>{{ $data->email }}</td>
							<td>	
								<form action="{{route('parents.destroy',$data->id)}}" method="post">
									<a href="{{route('parents.show',$data->id)}}" class="btn btn-info btn-xs"><i class="fa fa-eye" aria-hidden="true"></i></a>
								    <a href="{{route('parents.edit',$data->id)}}" class="btn btn-warning btn-xs"><i class="fa fa-pencil" aria-hidden="true"></i></a>
									{{ method_field('DELETE') }}
    								@csrf
    								<button type="submit" class="btn btn-danger btn-xs btn-remove"><i class="fa fa-eraser" aria-hidden="true"></i></button>
								</form>
							</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@endsection