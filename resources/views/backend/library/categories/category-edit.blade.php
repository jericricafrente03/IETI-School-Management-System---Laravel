@extends('layouts.backend')
@section('content')
<div class="row">
	<div class="col-md-4">
		<div class="panel panel-default" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title" >
					{{_lang('Edit Category')}}
				</div>
			</div>
			<div class="panel-body">
				<form action="{{route('bookcategories.update',$category->id)}}" class="form-horizontal form-groups-bordered validate" enctype="multipart/form-data" method="post" accept-charset="utf-8">
					@csrf
					{{ method_field('PATCH') }}
					<div class="form-group">
					    <div class="col-sm-12">
						    <label class="control-label">{{_lang('Category Name')}}</label>
							<input type="text" class="form-control" name="category_name" value="{{ $category->category_name }}" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-info">{{_lang('Update Category')}}</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-8">
		<div class="panel panel-default" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title" >
					{{_lang('Categories List')}}
				</div>
			</div>
			<div class="panel-body no-export">
				<table class="table table-bordered data-table">
					<thead>
						<th>#</th>
						<th>{{_lang('Name')}}</th>
						<th>{{_lang('Action')}}</th>
					</thead>
					<tbody>
						@php
						$i = 1;
						@endphp
						@foreach($categories AS $data)
						 <tr>
						 	<td>{{$i}}</td>
							<td>{{$data->category_name}}</td>
							<td>
								<form action="{{route('bookcategories.destroy',$data->id)}}" method="post">
								    <a href="{{route('bookcategories.edit',$data->id)}}" class="btn btn-warning btn-xs"><i class="fa fa-pencil" aria-hidden="true"></i></a>
									{{ method_field('DELETE') }}
    								@csrf
    								<button type="submit" class="btn btn-danger btn-xs btn-remove"><i class="fa fa-eraser" aria-hidden="true"></i></button>
								</form>
							</td>
						</tr>
						@endforeach
						@php
						$i ++;
						@endphp
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@endsection