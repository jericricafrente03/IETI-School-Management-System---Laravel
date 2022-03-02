@extends('layouts.backend')
@section('content')
<div class="row">
	<div class="col-md-12">
	   <form class="params-panel validate" action="{{ url('students/promote/3') }}" method="post" autocomplete="off" accept-charset="utf-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="panel-title" >
					{{_lang('Promote Student')}}
				</span>
			</div>
			<div class="panel-body">			
				@csrf
				<div class="col-md-10">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">{{ _lang('Selected Class') }}</label>
							<input type="hidden" name="class_id" value="{{ $class_id }}">
							<select name="disabled_class_id" class="form-control select2" disabled>
								<option value="">{{ _lang('Select One') }}</option>
								{{ create_option('classes','id','class_name',$class_id) }}
							</select>
						</div>
					</div>
					
					<div class="col-md-6">						
						<div class="form-group">
							<label class="control-label">{{ _lang('Promote Section') }}</label>
							<select name="promote_class_id" class="form-control select2" required>
								<option value="">{{ _lang('Select One') }}</option>
								@foreach($results as $table)
									<option value="{{ $table->id }}">{{ $table->section_name }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="form-group">
						<button type="submit" style="margin-top:24px;" class="btn btn-primary btn-block rect-btn">{{_lang('Proceed')}}</button>
					</div>
				</div>
				

			</div>
		</div><!--End Panel-->
		
	  </form>
	</div>
</div>
@endsection