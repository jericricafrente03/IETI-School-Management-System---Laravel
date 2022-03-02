<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Teacher;
use App\User;
use Validator;
use Hash;
use Image;

class TeacherController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teachers = Teacher::select('*','teachers.id AS id')
                            ->join('users','users.id','=','teachers.user_id')
                            ->orderBy('teachers.id', 'DESC')->get();
        return view('backend.teachers.teacher-list',compact('teachers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.teachers.teacher-add');
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
            'name' => 'required|string|max:191',
            'designation' => 'required|string|max:191',
            'birthday' => 'required',
            'gender' => 'required|string|max:191',
            'religion' => 'required|string|max:191',
            'phone' => 'required|string|max:191',
			'address' => 'required',
            'joining_date' => 'required',
            'email' => 'required|string|email|max:191|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'image' => 'nullable|image|max:5120',
        ]);

        $ImageName='profile.png';
        if ($request->hasFile('image')){
             $image = $request->file('image');
             $ImageName = time().'.'.$image->getClientOriginalExtension();
             Image::make($image)->resize(400, 400)->save(base_path('public/uploads/images/teachers/') . $ImageName);
        }

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->user_type = 'Teacher';
		$user->phone = $request->phone;
        $user->image = 'teachers/'.$ImageName;
        $user->save();

        $teacher = new Teacher();
        $teacher->user_id = $user->id;
		$teacher->name = $request->name;
        $teacher->designation = $request->designation;
        $teacher->birthday = $request->birthday;
        $teacher->gender = $request->gender;
        $teacher->religion = $request->religion;
        $teacher->phone = $request->phone;
        $teacher->address = $request->address;
        $teacher->joining_date = $request->joining_date;
        $teacher->save();

        return redirect('teachers')->with('success', _lang('Information has been added'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $teacher = Teacher::select('*','teachers.id AS id')
                            ->join('users','users.id','=','teachers.user_id')
                            ->where('teachers.id',$id)
                            ->first();
        return view('backend.teachers.teacher-view',compact('teacher'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $teacher = Teacher::select('*','teachers.id AS id')
                            ->join('users','users.id','=','teachers.user_id')
                            ->where('teachers.id',$id)
                            ->first();
        return view('backend.teachers.teacher-edit',compact('teacher'));
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
        $teacher = Teacher::find($id);
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'designation' => 'required|string|max:191',
            'birthday' => 'required',
            'gender' => 'required|string|max:191',
            'religion' => 'required|string|max:191',
            'phone' => 'required|string|max:191',
            'address' => 'required',
            'joining_date' => 'required',
            'email' => [
                'required',
                Rule::unique('users')->ignore($teacher->user_id),
            ],
            'password' => 'nullable|min:6|confirmed',
            'image' => 'nullable|image|max:5120',
        ]);

        $teacher->name = $request->name;
        $teacher->designation = $request->designation;
        $teacher->birthday = $request->birthday;
        $teacher->gender = $request->gender;
        $teacher->religion = $request->religion;
        $teacher->phone = $request->phone;
        $teacher->address = $request->address;
        $teacher->joining_date = $request->joining_date;
        $teacher->save();

        $user = User::find($teacher->user_id);
        $user->name = $request->name;
        $user->email = $request->email;
		$user->phone = $request->phone;
        if($request->password){
            $user->password = Hash::make($request->password);
        }
        if ($request->hasFile('image')){
             $image = $request->file('image');
             $ImageName = time().'.'.$image->getClientOriginalExtension();
             Image::make($image)->resize(400, 400)->save(base_path('public/uploads/images/teachers/') . $ImageName);
             $user->image = 'teachers/'.$ImageName;
        }
        $user->save();

        return redirect('teachers')->with('success', _lang('Information has been updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $teacher = Teacher::find($id);
        $teacher->delete();
        $user = User::find($teacher->user_id);
        $user->delete();

        return redirect('teachers')->with('success', _lang('Information has been deleted'));
    }
}
