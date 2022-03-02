@extends('layouts.backend')

@section('css')
<style type="text/css">
	small.help-block {
  	color: red;
	}
</style>	
@section('content')

<div class="row">
	<div class="col-md-12">
	   <form class="params-panel validate" action="{{ url('students/promote/4') }}" method="post" autocomplete="off" accept-charset="utf-8" id="form">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="panel-title" >
					{{_lang('Promote Student')}}
				</span>
			</div>
			<div class="panel-body">			
				@csrf
				<div class="col-md-12">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">{{ _lang('Selected Class') }}</label>
							<input type="hidden" name="class_id" value="{{ $class_id }}">
							<select name="disabled_class_id" class="form-control select2" disabled>
								<option  value="">{{ _lang('Select One') }}</option>
								{{ create_option('classes','id','class_name',$class_id) }}
							</select>
						</div>
					</div>
					
					<div class="col-md-6">						
						<div class="form-group">
							<label class="control-label">{{ _lang('Promote Section') }}</label>
							<input type="hidden" name="class_section" value="{{ $class_section }}">
							<select name="promote_class_id" class="form-control select2" disabled>
								<option value="">{{ _lang('Select One') }}</option>
								{{ create_option('sections','id','section_name',$class_section) }}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div><!--End Panel-->
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="panel-title" >
					{{_lang('Student List')}}
				</span>
			</div>
			<div class="panel-body">
			   <div class="col-md-12">
				   <table class="table table-bordered data-table">
					<thead>
						<th>{{ _lang('Action') }}</th>
						<th>{{ _lang('Profile') }}</th>
						<th>{{ _lang('Roll') }}</th>
						<th>{{ _lang('Name') }}</th>
						<th>{{ _lang('Class') }}</th>						
						<th>{{ _lang('Section') }}</th>
						<th>{{ _lang('Marks') }}</th>
					</thead>
					<tbody>
						@foreach($students AS $data)
						<tr>
							
							<td align="center"><input type="checkbox" name="student_checkbox[]" class="student_checkbox" value="{{$data->id}}" /></td>
							<td><img src="{{ asset('public/uploads/images/'.$data->image) }}" width="50px" alt=""></td>
							<td>{{ $data->roll }}</td>
							<td>{{ $data->name }}</td>
							<td>{{ $data->class_name }}</td>
							<td>{{ $data->section_name }}</td>
							<input type="hidden" name="roll" value="{{ $data->roll }}">	
							<td>	
								<a href="{{ url('marks/view/'.$data->id.'/'.$class_section) }}" class="btn btn-primary btn-sm rect-btn"><i class="fa fa-eye"></i> {{ _lang('View Marks') }}</a>		
							</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			   </div>			
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="panel-title" >
					{{_lang('Promote into Session')}}
				</span>
			</div>
			<div class="panel-body">
				<div class="col-md-10">
					<div class="col-md-6">						
						<div class="form-group">
							<label class="control-label">{{ _lang('Current Session') }}</label>					
							<select class="form-control select2" name="promoted_session_current" disabled>
								<option value="">{{ _lang('Select One') }}</option>
								@foreach(get_table('academic_years') as $session))
									<option value="{{ $session->id }}" {{ $session->id==get_option('academic_year') ? "selected" : "" }}>{{ $session->session }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="col-md-6">						
						<div class="form-group">
							<label class="control-label">{{ _lang('Promote Session') }}</label>					
							<select class="form-control select2" name="promoted_session" required>
								<option value="">{{ _lang('Select One') }}</option>
								@foreach(get_table("academic_years",array("id !="=>get_option('academic_year'))) as $table)
									<option value="{{ $table->id }}">{{ $table->session }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<button type="submit" id="submit" style="margin-top:24px;" class="btn btn-primary btn-block rect-btn">{{_lang('Promote')}}</button>
					</div>
				</div>
				
			</div>
		</div>
	  </form>
	</div>
</div>
@endsection

@section('js-script')
<script src="{{ asset('public/backend') }}/js/bootstrapvalidator.min.js"></script>

<script>

  $(document).ready(function() {
	$('#form').bootstrapValidator({
	fields: {

		 'student_checkbox[]': {
			validators: {
				notEmpty: {
					message: 'Please Select Student to Promote'
				}
			}
		},
		promoted_session: {
			validators: {
				notEmpty: {
					message: 'Choose your Session Year'
				}
			}
		},
		
		}
	});
	 
});

</script>
@endsection