@extends('layouts.backend')

@section('content')

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading"><span class="panel-title">{{ _lang('List Mark Distribution') }}</span>
			<a class="btn btn-primary btn-sm pull-right" data-title="{{ _lang('Add Mark Distribution') }}" href="{{route('mark_distributions.create')}}">{{ _lang('Add New') }}</a>
			</div>

			<div class="panel-body">
			 @if (\Session::has('success'))
			  <div class="alert alert-success">
				<p>{{ \Session::get('success') }}</p>
			  </div>
			  <br />
			 @endif
			<table class="table table-bordered data-table">
			<thead>
			  <tr>
				<th>{{ _lang('Mark Distribution Type') }}</th>
				<th>{{ _lang('Mark Percentage') }}</th>
				<th style="text-align: center;">{{ _lang('Active') }}</th>
				<th>{{ _lang('Action') }}</th>
			  </tr>
			</thead>
			<tbody>
			  
			  @foreach($markdistributions as $markdistribution)
			  <tr id="row_{{ $markdistribution->id }}">
				    <td class='mark_distribution_type'>{{ $markdistribution->mark_distribution_type }}</td>
					<td class='mark_percentage'>{{ decimalPlace($markdistribution->mark_percentage) }}</td>
					<td class='marks_to' style="text-align: center;">
						<span class="label {{ $markdistribution->is_active=='yes' ? 'label-info' : 'label-danger' }}">{{ ucwords($markdistribution->is_active) }}</span>
					</td>
					<td>
					@if ($markdistribution->is_exam == 'no')			
					  <form action="{{action('MarkDistributionController@destroy', $markdistribution['id'])}}" method="post">
						<a href="{{action('MarkDistributionController@edit', $markdistribution['id'])}}" data-title="{{ _lang('Update Mark Distribution') }}" class="btn btn-warning btn-sm">{{ _lang('Edit') }}</a>
						<a href="{{action('MarkDistributionController@show', $markdistribution['id'])}}" data-title="{{ _lang('View Mark Distribution') }}" class="btn btn-info btn-sm ajax-modal">{{ _lang('View') }}</a>
						{{ csrf_field() }}
						<input name="_method" type="hidden" value="DELETE">
						<button class="btn btn-danger btn-sm btn-remove" type="submit">{{ _lang('Delete') }}</button>
					  </form>				
					@else
						<a href="{{action('MarkDistributionController@edit', $markdistribution['id'])}}" data-title="{{ _lang('Update Mark Distribution') }}" class="btn btn-warning btn-sm">{{ _lang('Edit') }}</a>
						<a href="{{action('MarkDistributionController@show', $markdistribution['id'])}}" data-title="{{ _lang('View Mark Distribution') }}" class="btn btn-info btn-sm ajax-modal">{{ _lang('View') }}</a>
					@endif
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


