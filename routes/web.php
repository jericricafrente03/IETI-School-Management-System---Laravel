<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['install']], function () {	
	//Auth Route
	Route::get('/login', function () {
		return redirect('login');
	});

	Auth::routes();	
	
	//Frontend Route
	Route::get('/', 'WebsiteController@index');
	Route::get('/post/{slug?}', 'WebsiteController@single');
	Route::get('/category/{id?}', 'WebsiteController@category_archive');
	Route::get('/notice/{id?}', 'WebsiteController@notice');
	Route::get('/event/{id?}', 'WebsiteController@event');
	Route::post('/contact/send_message', 'WebsiteController@send_message');
	Route::get('/site/{slug?}', 'WebsiteController@index');

	
	Route::group(['middleware' => ['auth']], function () {
		/** Common Route for All **/
		Route::get('dashboard','DashboardController@index')->name('dashboard');	

		//Database Route
		Route::get('data','DatabaseController@index')->name('datamanagement');

		
		//Profile Controller
		Route::get('profile/my_profile', 'ProfileController@my_profile');
		Route::get('profile/edit', 'ProfileController@edit');
		Route::post('profile/update', 'ProfileController@update');
		Route::get('profile/changepassword', 'ProfileController@change_password');
		Route::post('profile/updatepassword', 'ProfileController@update_password');
			
		
		/** Permission Route Group **/
		Route::group(['middleware' => ['permission']], function () {
		
			//User Controller
			Route::get('users/get_users/{user_type}', 'UserController@get_users');
			Route::resource('users','UserController');

			Route::resource('teachers','TeacherController');
			
			//Parents Route
			Route::get('parents/get_parents','ParentController@get_parents');
			Route::resource('parents','ParentController');

			//Student Route
			Route::get('students/id_card/{student_id}', 'StudentController@id_card')->name('students.view_id_card');
			Route::get('students/class/{class_id?}', 'StudentController@class')->name('students.index');
			Route::get('students/get_subjects/{class_id}', 'StudentController@get_subjects');
			Route::get('students/get_students/{class_id}/{section_id}', 'StudentController@get_students');
			Route::match(['get','post'],'students/promote/{step?}','StudentController@promote')->name('students.promote');
			Route::resource('students','StudentController');
			
			//Class Controller
			Route::resource('class','ClassController');
			
			//Section Route
			Route::post('sections/section', 'SectionController@get_section');
			Route::get('sections/class/{class_id}', 'SectionController@index')->name('sections.index');
			Route::resource('sections','SectionController');
			
			//Subject Route
			Route::get('subjects/class/{class_id}', 'SubjectController@index')->name('subjects.index');
			Route::post('subjects/subject', 'SubjectController@get_subject');
			Route::resource('subjects','SubjectController');
			
			//Assign Subject Route
			Route::post('assignsubjects/search', 'AssignSubjectController@search')->name('assignsubjects.index');
			Route::resource('assignsubjects','AssignSubjectController');
			
			Route::resource('syllabus','SyllabusController');
			Route::resource('assignments','AssignmentController');
			Route::resource('academic_years','AcademicYearController');	
			Route::resource('student_groups','StudentGroupController');
			
			//Class Routine
			Route::get('class_routines', 'ClassRoutineController@index')->name('class_routines.index');
			Route::get('class_routines/class/{class_id}', 'ClassRoutineController@class')->name('class_routines.index');
			Route::get('class_routines/manage/{class_id}/{section_id}', 'ClassRoutineController@manage')->name('class_routines.edit');
			Route::post('class_routines/store', 'ClassRoutineController@store')->name('class_routines.create');
			Route::get('class_routines/show/{class_id}/{section_id}', 'ClassRoutineController@show')->name('class_routines.index');
			
			//Attendance Controller
			Route::match(['get','post'],'student/attendance','AttendanceController@student_attendance')->name('student_attendance.create');
			Route::post('student/attendance/save', 'AttendanceController@student_attendance_save')->name('student_attendance.create');
			Route::match(['get','post'],'staff/attendance','AttendanceController@staff_attendance')->name('staff_attendance.create');
			Route::post('staff/attendance/save', 'AttendanceController@staff_attendance_save')->name('staff_attendance.create');
			
			
			//Utility Controller
			Route::match(['get', 'post'],'administration/general_settings/{store?}', 'UtilityController@settings')->name('general_settings.update');
			Route::post('administration/theme_option/{store?}', 'UtilityController@update_theme_option')->name('theme_option.update');
			Route::get('administration/change_session/{session_id}', 'UtilityController@change_session')->name('general_settings.update');
			Route::post('administration/upload_logo', 'UtilityController@upload_logo')->name('general_settings.update');
			Route::get('administration/backup_database', 'UtilityController@backup_database')->name('utility.backup_database');

			//Language Controller
			Route::resource('languages','LanguageController');
			
			//PickList Controller
			Route::get('picklists/type/{type}', 'PicklistController@type')->name('picklists.index');
			Route::resource('picklists','PicklistController');

			//Library Controller
			Route::get('librarymembers/librarycard/{id}', 'LibraryMemberController@library_card')->name('librarymembers.view_library_card');
			Route::post('librarymembers/section', 'LibraryMemberController@get_section');
			Route::post('librarymembers/student', 'LibraryMemberController@get_student');
			Route::resource('librarymembers','LibraryMemberController');

			//Book Controller
			Route::resource('books','BookController');

			//Book Issue  Controller
			Route::match(['get','post'],'bookissues/list/{library_id?}','BookIssueController@index')->name('bookissues.index');
			Route::get('bookissues/return/{id}', 'BookIssueController@book_return')->name('bookissues.return');
			Route::resource('bookissues','BookIssueController');

			//BookCategory Controller
			Route::resource('bookcategories','BookCategoryController');

			//Transport Controller
			Route::resource('transportvehicles','TransportVehicleController');

			//Transport Controller
			Route::resource('transports','TransportController');

			//Transport Member Controller
			Route::post('transportmembers/section', 'TransportMemberController@get_section');
			Route::post('transportmembers/student', 'TransportMemberController@get_student');
			Route::post('transportmembers/transport_fee', 'TransportMemberController@get_transport_fee');
			Route::get('transportmembers/list/{type?}/{class?}', 'TransportMemberController@index')->name('transportmembers.index');
			Route::resource('transportmembers','TransportMemberController');

			//Hostel Controller
			Route::resource('hostels','HostelController');

			//Hostel Category Controller
			Route::resource('hostelcategories','HostelCategoryController');

			//Hostel Member Controller
			Route::get('hostelmembers/class/{class_id}', 'HostelMemberController@index')->name('hostelmembers.index');
			Route::get('hostelmembers/create/{id?}', 'HostelMemberController@create')->name('hostelmembers.create');
			Route::post('hostelmembers/standard', 'HostelMemberController@get_standard');
			Route::post('hostelmembers/hostel_fee', 'HostelMemberController@get_hostel_fee');
			Route::resource('hostelmembers','HostelMemberController');
			
			// Exam Controller
			Route::match(['get', 'post'],'exams/schedule/{type?}', 'ExamController@exam_schedule')->name('exams.view_schedule');
			Route::match(['get', 'post'],'exams/attendance', 'ExamController@exam_attendance')->name('exams.store_exam_attendance');
			Route::post('exams/store_exam_attendance', 'ExamController@store_exam_attendance')->name('exams.store_exam_attendance');
			Route::post('exams/store_schedule', 'ExamController@store_exam_schedule')->name('exams.store_exam_schedule');
			Route::post('exams/get_exam', 'ExamController@get_exam');
			Route::post('exams/get_subject', 'ExamController@get_subject');
			Route::post('exams/get_teacher_subject', 'ExamController@get_teacher_subject');
			Route::resource('exams','ExamController');
			
			
			//Grade Controller
			Route::resource('grades','GradeController');
			
			//Mark Distribution Controller
			Route::resource('mark_distributions','MarkDistributionController');
			
			//Mark Register
			Route::match(['get', 'post'],'marks/rank/{class?}', 'MarkController@student_ranks')->name('marks.view_student_rank');	
			Route::match(['get', 'post'],'marks/create', 'MarkController@create')->name('marks.create');
			Route::post('marks/store','MarkController@store')->name('marks.store');
			Route::match(['get', 'post'],'marks/{class?}', 'MarkController@index')->name('marks.index');
			Route::get('marks/view/{student_id}/{class_id}', 'MarkController@view_marks')->name('marks.show');	
			
			//Bank & Cash Account Controller
			Route::resource('accounts','AccountController');
			
			//Chart Of Accounts Controller
			Route::resource('chart_of_accounts','ChartOfAccountController');
			
			//Payment Method Controller
			Route::resource('payment_methods','PaymentMethodController');
			
			//Payee/Payer Controller
			Route::resource('payee_payers','PayeePayerController');
			
			//Transaction Controller
			Route::get('transactions/income', 'TransactionController@income')->name('transactions.manage_income');
			Route::get('transactions/expense', 'TransactionController@expense')->name('transactions.manage_expense');
			Route::get('transactions/add_income', 'TransactionController@add_income')->name('transactions.add_income');
			Route::get('transactions/add_expense', 'TransactionController@add_expense')->name('transactions.add_expense');
			Route::resource('transactions','TransactionController');
			
			//Fee Type
			Route::resource('fee_types','FeeTypeController');
			
			//Invoice
			Route::get('invoices/class/{class_id}', 'InvoiceController@index')->name('invoices.index');
			Route::resource('invoices','InvoiceController');
			
			//Student Payments
			Route::get('student_payments/create/{invoice_id?}', 'StudentPaymentController@create')->name('student_payments.create');
			Route::get('student_payments/class/{class_id}', 'StudentPaymentController@index')->name('student_payments.index');
			Route::resource('student_payments','StudentPaymentController');
			
			//Message Controller
			Route::get('message/compose', 'MessageController@create');
			Route::get('message/outbox', 'MessageController@send_items');
			Route::get('message/inbox', 'MessageController@inbox_items');
			Route::get('message/outbox/{id}', 'MessageController@show_outbox');
			Route::get('message/inbox/{id}', 'MessageController@show_inbox');
			Route::post('message/send', 'MessageController@send');
			
			//SMS Controller
			Route::get('sms/compose', 'SmsController@create')->name('sms.compose');
			Route::get('sms/logs', 'SmsController@logs')->name('sms.view_logs');
			Route::post('sms/send', 'SmsController@send')->name('sms.compose');
			
			//Email Controller
			Route::get('email/compose', 'EmailController@create')->name('email.compose');
			Route::get('email/logs', 'EmailController@logs')->name('email.view_logs');
			Route::post('email/send', 'EmailController@send')->name('email.compose');
			
			//Notice Controller
			Route::get('notices/{id}','NoticeController@show')->where('id', '[0-9]+');
			Route::resource('notices','NoticeController');
			
			//Event Controller
			Route::get('events/{id}','EventController@show')->where('id', '[0-9]+');
			Route::resource('events','EventController');
			
			//Report Controller
			Route::match(['get', 'post'],'reports/student_attendance_report/{view?}', 'ReportController@student_attendance_report')->name('reports.student_attendance_report');
			Route::match(['get', 'post'],'reports/staff_attendance_report/{view?}', 'ReportController@staff_attendance_report')->name('reports.staff_attendance_report');
			Route::match(['get', 'post'],'reports/student_id_card/{view?}', 'ReportController@student_id_card')->name('reports.student_id_card');
			Route::match(['get', 'post'],'reports/exam_report/{view?}', 'ReportController@exam_report')->name('reports.exam_report');
			Route::match(['get', 'post'],'reports/progress_card/{view?}', 'ReportController@progress_card')->name('reports.progress_card');
			Route::match(['get', 'post'],'reports/class_routine/{view?}', 'ReportController@class_routine')->name('reports.class_routine');
			Route::match(['get', 'post'],'reports/exam_routine/{view?}', 'ReportController@exam_routine')->name('reports.exam_routine');
			Route::match(['get', 'post'],'reports/income_report/{view?}', 'ReportController@income_report')->name('reports.income_report');
			Route::match(['get', 'post'],'reports/expense_report/{view?}', 'ReportController@expense_report')->name('reports.expense_report');
			Route::get('reports/account_balance', 'ReportController@account_balance')->name('reports.account_balance');
			
			//Permission Controller
			Route::get('permission/control/{role_id?}', 'PermissionController@index')->name('permission.manage');
			Route::post('permission/store', 'PermissionController@store')->name('permission.manage');

			
			//Role Controller
			Route::resource('permission_roles','RoleController');
			
			//CMS Controller
			Route::get('posts/type/{type?}','PostController@index')->name("posts.custom_post_list");
			Route::resource('posts','PostController');
			
			
			//Page Controller
			Route::resource('pages','PageController');
			
			//Post Categrory
			Route::get('post_categories/get_category','PostCategoryController@get_category');
			Route::resource('post_categories','PostCategoryController');
			
			//Route::get('website_languages/translate/{language_id?}','WebsiteLanguageController@translate')->name("website_languages.translate");
			//Route::post('website_languages/store_translate','WebsiteLanguageController@store_translate')->name("website_languages.translate");
			//Route::resource('website_languages','WebsiteLanguageController');
			
			//Site Navigation
			Route::resource('site_navigations','SiteNavigationController');
			Route::get('site_navigation_items/navigation/{navigation_id?}','NavigationItemController@index')->name("site_navigation_items.index");
			Route::get('site_navigation_items/create/{navigation_id?}','NavigationItemController@create')->name("site_navigation_items.create");
			Route::resource('site_navigation_items','NavigationItemController');
			
			Route::match(['get', 'post'],'website/menu_sorting', 'FrontendSettingController@menu_sorting')->name('website.menu_sorting');
			Route::match(['get', 'post'],'website/theme_option', 'FrontendSettingController@theme_option')->name('website.theme_option');
		
		});
		
		
		/** Teacher Route Group **/
		Route::group(['middleware' => ['teacher']], function () {
			Route::get('teacher/my_profile', 'Users\TeacherController@my_profile');
			Route::get('teacher/class_schedule', 'Users\TeacherController@class_schedule');
			Route::get('teacher/mark_register', 'Users\TeacherController@mark_register');
			Route::post('teacher/marks/create', 'Users\TeacherController@create_mark');
			Route::post('teacher/marks/store', 'Users\TeacherController@store_mark');
			Route::get('teacher/assignments', 'Users\TeacherController@assignments');
			Route::get('teacher/create_assignment', 'Users\TeacherController@create_assignment');
			Route::post('teacher/store_assignment', 'Users\TeacherController@store_assignment');
			Route::get('teacher/edit_assignment/{id}', 'Users\TeacherController@edit_assignment');
			Route::get('teacher/assignment/{id}', 'Users\TeacherController@show_assignment');
			Route::post('teacher/update_assignment/{id}', 'Users\TeacherController@update_assignment');
			Route::get('teacher/destroy_assignment/{id}', 'Users\TeacherController@destroy_assignment');
		});	
		
		
		/** Student Route Group **/
		Route::group(['middleware' => ['student']], function () {
			Route::get('student/my_profile', 'Users\StudentController@my_profile');
			Route::get('student/my_subjects', 'Users\StudentController@my_subjects');
			Route::get('student/class_routine', 'Users\StudentController@class_routine');
			Route::match(['get', 'post'],'student/exam_routine/{view?}', 'Users\StudentController@exam_routine');
			Route::get('student/progress_card', 'Users\StudentController@progress_card');
			Route::get('student/my_invoice/{status?}', 'Users\StudentController@my_invoice');
			Route::get('student/view_invoice/{id?}', 'Users\StudentController@view_invoice');
			Route::get('student/invoice_payment/{method?}/{invoice_id?}', 'Users\StudentController@invoice_payment');
			Route::get('student/paypal/{action?}/{invoice_id?}', 'Users\StudentController@paypal');
			Route::post('student/stripe_payment/{invoice_id?}', 'Users\StudentController@stripe_payment');
			Route::get('student/payment_history', 'Users\StudentController@payment_history');
			Route::get('student/library_history', 'Users\StudentController@library_history');
			Route::get('student/my_assignment', 'Users\StudentController@my_assignment');
			Route::get('student/view_assignment/{id?}', 'Users\StudentController@view_assignment');
			Route::get('student/my_syllabus', 'Users\StudentController@my_syllabus');
			Route::get('student/view_syllabus/{id?}', 'Users\StudentController@view_syllabus');
		});
		
		
		/** Parent Route Group **/
		Route::group(['middleware' => ['parent']], function () {
			Route::get('parent/my_profile', 'Users\ParentController@my_profile');
			Route::get('parent/my_children/{student_id?}', 'Users\ParentController@my_children');
			Route::match(['get', 'post'],'parent/children_attendance/{student_id?}', 'Users\ParentController@children_attendance');
			Route::get('parent/progress_card/{student_id?}', 'Users\ParentController@progress_card');
		});
				
	});

});

Route::get('/installation', 'Install\InstallController@index');
Route::get('install/database', 'Install\InstallController@database');
Route::post('install/process_install', 'Install\InstallController@process_install');
Route::get('install/create_user', 'Install\InstallController@create_user');
Route::post('install/store_user', 'Install\InstallController@store_user');
Route::get('install/system_settings', 'Install\InstallController@system_settings');
Route::post('install/finish', 'Install\InstallController@final_touch');

Route::post('student/paypal_ipn','GatewayController@paypal_ipn');	