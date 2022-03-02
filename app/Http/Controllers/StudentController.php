<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Rules\UniqueRoll;
use App\Student;
use App\StudentSession;
use App\User;
use App\ClassModel;
use App\Section;
use App\Subject;
use App\ParentModel;
use Carbon\Carbon;
use DB;
use Validator;
use Hash;
use Image;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = array();
        $class = "";		
        return view('backend.students.student-list',compact('students','class'));
    }

	public function class($class='')
    {
		$class = $class;
        $students = Student::join('users','users.id','=','students.user_id')
							->join('student_sessions','students.id','=','student_sessions.student_id')
                            ->join('classes','classes.id','=','student_sessions.class_id')
                            ->join('sections','sections.id','=','student_sessions.section_id')
							->select('users.*','student_sessions.roll','classes.class_name','sections.section_name','students.id as id')						
							->where('student_sessions.student_id',get_option('academic_year'))
                            ->where('student_sessions.class_id',$class)
                            ->where('users.user_type','Student')
                            ->orderBy('student_sessions.roll', 'ASC')
                            ->get();							
        return view('backend.students.student-list',compact('students','class'));
    }
	
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $sections = Section::join('classes','classes.id','=','sections.class_id')
                                 ->get();
        return view('backend.students.student-add',compact('sections'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required|string|max:191',
            'last_name' => 'required|string|max:191',
            'guardian' => 'required',
            'birthday' => 'required',
            'gender' => 'required|string|max:10',
            'blood_group' => 'nullable|string|max:4',
            'religion' => 'required|string|max:20',
            'phone' => 'string|max:20',
            'state' => 'required|string|max:191',
            'country' => 'required|string|max:100',
            'class' => 'required',
            'section' => 'required',
            'group' => 'nullable|string|max:191',
            'register_no' => 'required||unique:students',
			'roll' =>['required', new UniqueRoll($request->section,$request->roll)],
            'activities' => 'nullable|string|max:191',
            'remarks' => 'nullable',
            'email' => 'required|string|email|max:191|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'image' => 'nullable|image|max:5120',
        ]);

        $ImageName='profile.png';
        if ($request->hasFile('image')){
             $image = $request->file('image');
             $ImageName = time().'.'.$image->getClientOriginalExtension();
             Image::make($image)->resize(200, 160)->save(base_path('public/uploads/images/students/') . $ImageName);
        }
        
			//Create User
			$user = new User();
			$user->name = $request->first_name." ".$request->last_name;
			$user->email = $request->email;
			$user->password = Hash::make($request->password);
			$user->user_type = 'Student';
			$user->phone = $request->phone;
			$user->image = 'students/'.$ImageName;
			$user->save();

			//Create Student Information
			$student = new Student();
			$student->user_id = $user->id;
			$student->parent_id = $request->guardian;
			$student->first_name = $request->first_name;
			$student->last_name = $request->last_name;
			$student->birthday = $request->birthday;
			$student->gender = $request->gender;
			$student->blood_group = $request->blood_group;
			$student->religion = $request->religion;
			$student->phone = $request->phone;
			$student->address = $request->address;
			$student->state = $request->state;
			$student->country = $request->country;
			$student->register_no = $request->register_no;
			$student->group = $request->group;
			$student->activities = $request->activities;
			$student->remarks = $request->remarks;
			$student->save();
			
			//Create Student Session Information
			$studentSession = new StudentSession();
			$studentSession->session_id = get_option('academic_year');
			$studentSession->student_id = $student->id;
			$studentSession->class_id = $request->class;
			$studentSession->section_id = $request->section;
			$studentSession->roll = $request->roll;
			$studentSession->optional_subject = $request->optional_subject;
			$studentSession->save();

        return redirect('students/create')->with('success', _lang('Information has been added'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {								
		$student = Student::join('users','users.id','=','students.user_id')
                     ->join('student_sessions','students.id','=','student_sessions.student_id')
                     ->join('classes','classes.id','=','student_sessions.class_id')
                     ->join('sections','sections.id','=','student_sessions.section_id')
                     ->join('parents','parents.id','=','students.parent_id')
					 ->where('student_sessions.student_id',get_option('academic_year'))
                     ->where('students.id',$id)->first();
        return view('backend.students.student-view',compact('student'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data=[
            'classes' => ClassModel::orderBy('id', 'DESC')->get(),
            'sections' => Section::orderBy('id', 'DESC')->get(),
            'student' => Student::join('users','users.id','=','students.user_id')
                                ->join('student_sessions','students.id','=','student_sessions.student_id')
                                ->select('*','students.id as id','student_sessions.id as ss_id')
								->where('student_sessions.session_id',get_option('academic_year'))
                                ->where('students.id',$id)->first(),
        ];
        return view('backend.students.student-edit',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
		$student = Student::find($id);
		
        $this->validate($request, [
            'first_name' => 'required|string|max:191',
            'last_name' => 'required|string|max:191',
            'guardian' => 'required',
            'birthday' => 'required',
            'gender' => 'required|string|max:10',
            'blood_group' => 'nullable|string|max:4',
            'religion' => 'required|string|max:20',
            'phone' => 'string|max:20',
            'state' => 'required|string|max:191',
            'country' => 'required|string|max:100',
            'class' => 'required',
            'section' => 'required',
            'group' => 'nullable|string|max:191',
			'register_no' => [
                'required',
                Rule::unique('students')->ignore($id),
            ],
			'roll' =>['required', new UniqueRoll($request->section,$request->roll,$student->id)],
            'activities' => 'nullable|string|max:191',
            'remarks' => 'nullable',
            'email' => [
                'required',
                Rule::unique('users')->ignore($student->user_id),
            ],
            'password' => 'nullable|min:6|confirmed',
            'image' => 'nullable|image|max:5120',
        ]);
		
		
        $student->parent_id = $request->guardian;
		$student->first_name = $request->first_name;
        $student->last_name = $request->last_name;
        $student->birthday = $request->birthday;
        $student->gender = $request->gender;
        $student->blood_group = $request->blood_group;
        $student->religion = $request->religion;
        $student->phone = $request->phone;
        $student->address = $request->address;
        $student->state = $request->state;
        $student->country = $request->country;
        $student->register_no = $request->register_no;
        $student->group = $request->group;
        $student->activities = $request->activities;
        $student->remarks = $request->remarks;
        $student->save();
		
		//Update Student Session Information
		$studentSession = StudentSession::find($request->ss_id);
		$studentSession->session_id = get_option('academic_year');
		$studentSession->student_id = $student->id;
		$studentSession->class_id = $request->class;
		$studentSession->section_id = $request->section;
		$studentSession->roll = $request->roll;
		$studentSession->optional_subject = $request->optional_subject;
		$studentSession->save();
		

        $user = User::find($student->user_id);
        $user->name = $request->first_name." ".$request->last_name;
        $user->email = $request->email;
		$user->phone = $request->phone;
        if($request->password){
            $user->password = Hash::make($request->password);
        }

        if ($request->hasFile('image')){
             $image = $request->file('image');
             $ImageName = time().'.'.$image->getClientOriginalExtension();
             Image::make($image)->resize(200, 160)->save(base_path('public/uploads/images/students/') . $ImageName);
             $user->image = 'students/'.$ImageName;
        }
		
        $user->save();


        return redirect($_SERVER['HTTP_REFERER'])->with('success', _lang('Information has been updated'));
    }
	
	public function get_subjects( $class_id="" ){
		if($class_id != ""){
		   $subjects = Subject::where('class_id', $class_id)->get();
		   $options = '';
		   $options .= '<option value="">'._lang('Select One').'</option>';
		   foreach($subjects as $subject){
			   $options .= '<option value="'.$subject->id.'">'.$subject->subject_name.'</option>';
		   }
		   return $options;
		}
	}
	
	public function get_students( $class_id="", $section_id="" ){
		if($class_id != "" && $section_id != ""){
		   $students = Student::join('student_sessions','students.id','=','student_sessions.student_id')
					   ->select('students.*','student_sessions.roll')	
					   ->where('student_sessions.session_id', get_option('academic_year'))
					   ->where('student_sessions.class_id', $class_id)
					   ->where('student_sessions.section_id', $section_id)->get();
					   
		   return json_encode($students);
		}
	}

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		$student = Student::find($id);
        $student->delete();
        $user = User::find($student->user_id);
        $user->delete();

        return redirect('students')->with('success',_lang('Information has been deleted'));
    }
	
	//ID Card
	public function id_card($id)
    {								
		$student = Student::join('users','users.id','=','students.user_id')
                     ->join('student_sessions','students.id','=','student_sessions.student_id')
                     ->join('classes','classes.id','=','student_sessions.class_id')
                     ->join('sections','sections.id','=','student_sessions.section_id')
					 ->where('student_sessions.session_id',get_option('academic_year'))
                     ->where('students.id',$id)->first();
        return view('backend.students.modal.id_card',compact('student'));
    }
	
	public function promote(Request $request,$step=1){
		$class_id = "";
		if($step == 1){
		    return view('backend.marks.promote_student.step_one',compact('class_id'));
	    }else if($step == 2){
            $results = Section::where('class_id',$request->class_id)->get();
			$class_id = $request->class_id;
			return view('backend.marks.promote_student.step_two',compact('class_id','results'));
		}else if($step == 3){
            $class_id = $request->class_id;
            $class_section= $request->promote_class_id;
            $students = Student::join('users','users.id','=','students.user_id')
                                ->join('student_sessions','students.id','=','student_sessions.student_id')
                                ->join('classes','classes.id','=','student_sessions.class_id')
                                ->join('sections','sections.id','=','student_sessions.section_id')
                                ->select('users.*','student_sessions.roll','classes.class_name','sections.section_name','students.id as id')                        
                                ->where('student_sessions.session_id',get_option('academic_year'))
                                ->where('student_sessions.class_id',$class_id)
                                ->where('student_sessions.section_id', $class_section)
                                ->where('users.user_type','Student')
                                ->orderBy('student_sessions.roll', 'ASC')
                                ->get();
			return view('backend.marks.promote_student.step_three',compact('class_id','class_section','students'));

		}else if($step == 4){
            $error="error";
            $class_id = $request->class_id;
            $class_section= $request->class_section;
            $promotion= $request->promoted_session;
            $promote = $request->input('student_checkbox');
            $students = Student::join('users','users.id','=','students.user_id')
                                            ->join('student_sessions','students.id','=','student_sessions.student_id')
                                            ->join('classes','classes.id','=','student_sessions.class_id')
                                            ->join('sections','sections.id','=','student_sessions.section_id')
                                            ->select('users.*','student_sessions.roll','classes.class_name','sections.section_name','students.id as id')                        
                                            ->where('student_sessions.session_id',get_option('academic_year'))
                                            ->where('student_sessions.class_id',$class_id)
                                            ->where('student_sessions.section_id', $class_section)
                                            ->where('users.user_type','Student')
                                            ->orderBy('student_sessions.roll', 'ASC')
                                            ->get();
            $image = \App\StudentSession::firstOrNew(['session_id' => $promotion,'student_id' => $promote]);

             if (!isset($promote)) {
                notify()->error('Select Student to Promote.');
                return view('backend.marks.promote_student.step_three',compact('class_id','class_section','students'));
             }else{
                if ($image->id) {
                    connectify('error', 'Some Student are Already Promoted', 'Please Goto Administrator to Check. 😊');
                      return view('backend.marks.promote_student.step_three',compact('class_id','class_section','students'));
                }else{

                $promote_record = [];
                foreach ($promote as $new_promote) {
                    $now = Carbon::now();
                     $promote_record[] = [
                    'session_id' => $promotion,
                    'student_id' => $new_promote,
                    'class_id' => $class_id,  
                    'section_id' => $class_section, 
                    'roll'=> $request->roll,
                    'updated_at' => $now,  
                    'created_at' => $now, 
                ];
               
                }
                 StudentSession::insert($promote_record);
                 return redirect('students/promote')->with('success', _lang('Sucessfully Promoted.'));

                }
             }
             
        }
				
			
		
	}

}
