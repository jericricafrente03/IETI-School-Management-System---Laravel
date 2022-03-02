@extends('layouts.backend')

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
	<div class="panel-heading">{{ _lang('View Fee Type') }}</div>

	<div class="panel-body">
	  <table class="table table-bordered">
		<tr><td>{{ _lang('Fee Type') }}</td><td>{{ $feetype->fee_type }}</td></tr>
			<tr><td>{{ _lang('Fee Code') }}</td><td>{{ $feetype->fee_code }}</td></tr>
			<tr><td>{{ _lang('Note') }}</td><td>{{ $feetype->note }}</td></tr>
			
	  </table>
	</div>
  </div>
 </div>
</div>
@endsection


