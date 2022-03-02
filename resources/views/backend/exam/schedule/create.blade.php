@extends('layouts.backend')

@section('content')
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">
	<div class="panel-heading panel-title">{{ _lang('Exam Schedule') }}</div>

	<div class="panel-body">
	    @if ($type=='create')
		   <form method="post" class="params-panel validate" autocomplete="off" action="{{url('exams/schedule/create')}}">
	   	@else
		   <form method="post" class="params-panel validate" autocomplete="off" action="{{url('exams/schedule')}}">  
		@endif
		
			{{ csrf_field() }}
			
			<div class="col-md-4">
			  <div class="form-group">
				<label class="control-label">{{ _lang('Select Exam') }}</label>						
				<select class="form-control select2" name="exam" required>
				   <option value="">{{ _lang('Select One') }}</option>
				   {{ create_option("exams","id","name",isset($exam) ? $exam :old('exam'),array("session_id="=>get_option('academic_year'))) }}
				</select> 
			  </div>
			</div>
			
			<div class="col-md-4">
			  <div class="form-group">
				<label class="control-label">{{ _lang('Select Class') }}</label>						
				<select class="form-control select2" name="class" required>
				   <option value="">{{ _lang('Select One') }}</option>
				   {{ create_option("classes","id","class_name",isset($class) ? $class :old('class')) }}
				</select>
			  </div>
			</div>

					
			<div class="col-md-4">
			  <div class="form-group">
				<button type="submit" style="margin-top:24px;" class="btn btn-primary btn-block rect-btn">{{ _lang('Search') }}</button>
			  </div>
			</div>
		  </form>
		</div>
	  </div><!-- End Panel-->
	  
	  @if (isset($subjects) && $type=='create')
	  @if (count($subjects)>0)  
	  <div class="panel panel-default">
		<div class="panel-heading panel-title">{{ _lang('Exam Schedule') }}</div>

		<div class="panel-body">
		<form action="{{ url('exams/store_schedule') }}" class="appsvan-submit" autocomplete="off" method="post">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<th>{{ _lang('Subject') }}</th>
					<th>{{ _lang('Date') }}</th>
					<th>{{ _lang('Start Time') }}</th>
					<th>{{ _lang('End Time') }}</th>
					<th>{{ _lang('Room') }}</th>
				</thead>
				<tbody> 
					{{ csrf_field() }}
					@foreach($subjects as $subject)
						<tr>
						  <input type="hidden" name="schedules_id[]" value="{{ $subject->schedules_id }}">
						  <input type="hidden" name="subject_id[]" value="{{ $subject->subject_id }}">
						  <input type="hidden" name="class_id[]" value="{{ $class }}">
						  <input type="hidden" name="exam_id[]" value="{{ $exam }}">
						  
						  <td>{{ $subject->subject_name }}</td>
						  <td><input type="text" class="form-control datepicker" value="{{ $subject->date }}" name="date[]" required></td>
						  <td><input type="text" class="form-control timepicker" value="{{ $subject->start_time }}" name="start_time[]" required></td>
						  <td><input type="text" class="form-control timepicker" value="{{ $subject->end_time }}" name="end_time[]" required></td>
						  <td><input type="text" class="form-control int-field" value="{{ $subject->room }}" name="room[]" required></td>
						</tr>
					@endforeach	
					<tr><td colspan="7"><button type="submit" class="btn btn-primary rect-btn pull-right">{{ _lang('Submit Exam Schedule') }}</button></td></tr> 
				</tbody>
			</table>
		</div>
      </form>	
	</div>
	
  </div>
  @else
    <div class="alert alert-danger">
       <h5>{{ _lang('No Subject Assign for this class !') }}</h5>
    </div>
  @endif
  
  @endif
  
  
  
  <!--For View Emam Routine-->
  @if (isset($subjects) && $type=='view')
	  @if (count($subjects)>0) 
		<div class="panel panel-default">
		<div class="panel-heading">
		   <span class="panel-title">{{ _lang('Exam Routine') }}</span>
		   <button type="button" data-print="exam_routine" class="btn btn-primary btn-sm pull-right print"><i class="fa fa-print"></i> {{ _lang('Print Routine') }}</button>
		</div>

		<div class="panel-body" id="exam_routine">
		
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
				   <td colspan="100" class="text-center">
					  <span class="f-20">{{ get_option('school_name') }}</span></br>
					  <span class="f-18">{{ _lang('Exam Routine') }}</span></br> 
					  <span class="f-16">{{ _lang('Class') }}: {{ get_class_name($class) }}</span> 
				   </td>
				</tr>
			</table>	
			
			<table class="table table-bordered">		
				<tbody>  
					<thead>
						<th>{{ _lang('Subject') }}</th>
						<th>{{ _lang('Date') }}</th>
						<th>{{ _lang('Start Time') }}</th>
						<th>{{ _lang('End Time') }}</th>
						<th>{{ _lang('Room') }}</th>
					</thead>
					@foreach($subjects as $subject)
						<tr>
						  <td>{{ $subject->subject_name }}</td>
						  <td>{{ $subject->date }}</td>
						  <td>{{ $subject->start_time }}</td>
						  <td>{{ $subject->end_time }}</td>
						  <td>{{ $subject->room }}</td>
						</tr>
					@endforeach	
				</tbody>
			</table>
		</div>		
	</div>
	
  </div>
	
	   @else
		<div class="alert alert-danger">
		   <h5>{{ _lang('No Subject Assign for this class !') }}</h5>
		</div>
      @endif
  
  @endif
  
 </div>
</div>
@endsection


