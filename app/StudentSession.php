<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentSession extends Model
{

	/**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'student_sessions';

    protected $fillable = ['session_id','student_id','class_id','section_id','roll','optional_subject'];
}
