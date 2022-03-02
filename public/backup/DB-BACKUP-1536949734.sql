DROP TABLE IF EXISTS academic_years;

CREATE TABLE `academic_years` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO academic_years VALUES('1','2018','2018-2019','2018-06-01 07:06:24','2018-06-02 10:08:15');
INSERT INTO academic_years VALUES('13','2019','2019-2020','2018-06-02 10:24:27','2018-06-02 10:24:27');
INSERT INTO academic_years VALUES('14','2020','2020-2021','2018-07-08 08:29:07','2018-07-12 14:50:19');



DROP TABLE IF EXISTS assign_subjects;

CREATE TABLE `assign_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assign_subjects VALUES('12','1','1','1','2018-05-29 08:34:30','2018-06-05 10:27:02');
INSERT INTO assign_subjects VALUES('13','2','2','1','2018-05-29 08:34:30','2018-06-05 10:27:02');
INSERT INTO assign_subjects VALUES('16','3','1','1','2018-05-29 09:07:42','2018-06-05 10:27:02');
INSERT INTO assign_subjects VALUES('31','1','1','2','2018-05-30 06:13:29','2018-05-31 10:30:55');
INSERT INTO assign_subjects VALUES('32','2','1','2','2018-05-30 06:13:29','2018-05-31 10:30:55');
INSERT INTO assign_subjects VALUES('33','3','2','2','2018-05-30 06:13:29','2018-05-31 10:30:55');
INSERT INTO assign_subjects VALUES('34','4','2','1','2018-06-05 10:27:02','2018-06-05 10:27:02');



DROP TABLE IF EXISTS assignments;

CREATE TABLE `assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `deadline` date NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assignments VALUES('1','1','Test Assignment','<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><b>Contrary to popular belief</b>, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','2018-06-08','1','1','3','1527763042987.pdf','','','','2018-05-31 10:37:22','2018-08-31 06:28:08');



DROP TABLE IF EXISTS bank_cash_accounts;

CREATE TABLE `bank_cash_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO bank_cash_accounts VALUES('1','City bank Account','5000.00','','3','3','2018-07-13 14:37:22','2018-07-13 14:37:43');
INSERT INTO bank_cash_accounts VALUES('2','Sports Fund','2000.00','','3','','2018-07-13 14:38:16','2018-07-13 14:38:16');



DROP TABLE IF EXISTS book_categories;

CREATE TABLE `book_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO book_categories VALUES('1','Science','2018-08-29 11:18:55','2018-08-29 11:18:55');
INSERT INTO book_categories VALUES('2','Information Technology','2018-08-29 11:19:02','2018-08-29 11:19:21');
INSERT INTO book_categories VALUES('3','Freelancing','2018-08-29 16:42:09','2018-08-29 16:42:33');



DROP TABLE IF EXISTS book_issues;

CREATE TABLE `book_issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `library_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO book_issues VALUES('1','201853424','1','','2018-08-30','2018-09-15','2018-09-14','1','2018-08-30 09:49:16','2018-09-14 08:52:00');



DROP TABLE IF EXISTS books;

CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rack_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `publish_date` date NOT NULL,
  `photo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'book.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO books VALUES('1','Swift Programming','2','Kennedy','Packet Publishing','2','2','','2015-08-30','1535622512.jpg','2018-08-30 09:48:32','2018-08-30 09:48:32');
INSERT INTO books VALUES('2','Android Application Development','2','Leo Gomes','Packet Publishing','3','3','','2017-09-14','book.png','2018-09-14 08:47:40','2018-09-14 08:47:40');



DROP TABLE IF EXISTS chart_of_accounts;

CREATE TABLE `chart_of_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chart_of_accounts VALUES('1','Donation','income','2018-07-13 15:44:32','2018-07-13 15:44:32');
INSERT INTO chart_of_accounts VALUES('2','Others','income','2018-07-13 15:44:46','2018-07-13 15:44:46');
INSERT INTO chart_of_accounts VALUES('3','Staff Salary','expense','2018-07-13 15:45:51','2018-07-13 15:45:51');



DROP TABLE IF EXISTS class_days;

CREATE TABLE `class_days` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO class_days VALUES('1','SUNDAY','1','','');
INSERT INTO class_days VALUES('2','MONDAY','1','','');
INSERT INTO class_days VALUES('3','TUESDAY','1','','');
INSERT INTO class_days VALUES('4','WEDNESDAY','1','','');
INSERT INTO class_days VALUES('5','THURSDAY','1','','');
INSERT INTO class_days VALUES('6','FRIDAY','1','','');
INSERT INTO class_days VALUES('7','SATURDAY','1','','');



DROP TABLE IF EXISTS class_routines;

CREATE TABLE `class_routines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO class_routines VALUES('1','1','1','SUNDAY','12:00:00','12:40:00','2018-06-05 09:04:08','2018-07-08 16:46:18');
INSERT INTO class_routines VALUES('2','1','2','SUNDAY','10:00:00','10:45:00','2018-06-05 09:04:08','2018-07-08 16:46:18');
INSERT INTO class_routines VALUES('3','1','3','SUNDAY','10:50:00','11:40:00','2018-06-05 09:04:08','2018-07-08 16:46:18');
INSERT INTO class_routines VALUES('4','1','1','MONDAY','10:00:00','10:40:00','2018-06-05 09:04:51','2018-06-05 09:04:51');
INSERT INTO class_routines VALUES('5','1','3','MONDAY','10:45:00','11:25:00','2018-06-05 09:04:51','2018-06-05 09:04:51');
INSERT INTO class_routines VALUES('6','1','4','TUESDAY','11:00:00','11:40:00','2018-06-05 10:29:09','2018-06-05 10:29:09');



DROP TABLE IF EXISTS classes;

CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO classes VALUES('1','One','1','2018-05-25 08:15:51','2018-05-25 08:15:51');
INSERT INTO classes VALUES('2','Two','1','2018-05-25 08:15:54','2018-05-25 08:15:54');
INSERT INTO classes VALUES('3','Three','1','2018-07-12 14:33:46','2018-07-12 14:33:46');



DROP TABLE IF EXISTS custom_fields;

CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_data` text COLLATE utf8mb4_unicode_ci,
  `field_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS email_logs;

CREATE TABLE `email_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_logs VALUES('1','kennedyrodrick93@gma','First Email','<p><b>First Email</b><br></p>','3','2018-08-17 18:45:13','2018-08-17 18:45:13');
INSERT INTO email_logs VALUES('2','anthonyprobalgomez@g','Email from Apps Van smart school','<p>Hello, This is a testing email from smart school. So please ignore this email.</p><p><br></p><p>Regards</p><p>Francis</p><p>Apps Van</p>','3','2018-08-17 18:52:17','2018-08-17 18:52:17');
INSERT INTO email_logs VALUES('3','kennedyrodrick93@gma','Email from Apps Van smart school','<p>Hello, This is a testing email from smart school. So please ignore this email.</p><p><br></p><p>Regards</p><p>Francis</p><p>Apps Van</p>','3','2018-08-17 18:52:21','2018-08-17 18:52:21');
INSERT INTO email_logs VALUES('4','kennedyrodrick93@gma','This is final email','<p><b>Please check this final email</b></p>','3','2018-08-17 18:55:32','2018-08-17 18:55:32');



DROP TABLE IF EXISTS events;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO events VALUES('1','2018-09-16 10:00:00','2018-09-17 12:00:00','Test Event','<p>Test Event</p>','Dhaka, Bangladesh','2018-09-09 08:29:35','2018-09-09 08:29:35');



DROP TABLE IF EXISTS exam_attendances;

CREATE TABLE `exam_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO exam_attendances VALUES('4','6','1','2','1','1','2018-07-09','1','2018-07-09 09:14:07','2018-07-09 09:14:07');
INSERT INTO exam_attendances VALUES('5','6','1','3','1','1','2018-07-09','1','2018-07-09 09:14:07','2018-07-09 09:14:44');
INSERT INTO exam_attendances VALUES('6','6','1','4','1','1','2018-07-09','2','2018-07-09 09:14:07','2018-07-09 09:20:23');
INSERT INTO exam_attendances VALUES('7','6','2','2','1','1','2018-07-09','1','2018-07-09 09:22:44','2018-07-09 09:22:44');
INSERT INTO exam_attendances VALUES('8','6','2','3','1','1','2018-07-09','1','2018-07-09 09:22:44','2018-07-09 09:22:44');
INSERT INTO exam_attendances VALUES('9','6','2','4','1','1','2018-07-09','1','2018-07-09 09:22:44','2018-07-09 09:22:44');



DROP TABLE IF EXISTS exam_schedules;

CREATE TABLE `exam_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO exam_schedules VALUES('1','6','1','1','2018-07-10','12:00:00','16:00:00','34','2018-07-08 16:38:52','2018-08-19 14:00:37');
INSERT INTO exam_schedules VALUES('2','6','1','2','2018-07-11','12:00:00','16:00:00','34','2018-07-08 16:38:52','2018-08-19 14:00:37');
INSERT INTO exam_schedules VALUES('3','6','1','3','2018-07-12','12:00:00','16:00:00','34','2018-07-08 16:38:52','2018-08-19 14:00:37');
INSERT INTO exam_schedules VALUES('4','6','1','4','2018-07-14','12:00:00','16:00:00','34','2018-07-08 16:38:52','2018-08-19 14:00:37');
INSERT INTO exam_schedules VALUES('5','7','1','1','2018-08-11','12:00:00','15:00:00','40','2018-07-11 07:56:22','2018-07-11 09:17:09');
INSERT INTO exam_schedules VALUES('6','7','1','2','2018-08-12','12:00:00','15:00:00','40','2018-07-11 07:56:22','2018-07-11 09:17:09');
INSERT INTO exam_schedules VALUES('7','7','1','3','2018-08-14','12:00:00','15:00:00','40','2018-07-11 07:56:22','2018-07-11 09:17:09');
INSERT INTO exam_schedules VALUES('8','7','1','4','2018-08-15','12:00:00','15:00:00','40','2018-07-11 07:56:22','2018-07-11 09:17:09');



DROP TABLE IF EXISTS exams;

CREATE TABLE `exams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO exams VALUES('6','First Term Exam','','1','2018-07-08 08:47:25','2018-07-08 08:47:25');
INSERT INTO exams VALUES('7','Second Term Exam','','1','2018-07-08 08:47:33','2018-07-08 08:47:33');
INSERT INTO exams VALUES('8','Final Exam','','1','2018-08-30 08:43:03','2018-08-30 08:43:03');



DROP TABLE IF EXISTS fee_types;

CREATE TABLE `fee_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO fee_types VALUES('1','Monthly Fee','1001','','2018-07-14 08:23:58','2018-07-14 08:28:56');
INSERT INTO fee_types VALUES('2','Admission Fee','1002','','2018-07-14 08:24:13','2018-07-14 08:36:04');



DROP TABLE IF EXISTS grades;

CREATE TABLE `grades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks_from` decimal(8,2) NOT NULL,
  `marks_to` decimal(8,2) NOT NULL,
  `point` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO grades VALUES('1','A+','80.00','100.00','5.00','','2018-07-09 11:04:03','2018-07-11 11:08:07');
INSERT INTO grades VALUES('2','A','70.00','79.00','4.00','','2018-07-09 11:04:14','2018-07-11 11:08:24');
INSERT INTO grades VALUES('3','A-','60.00','69.00','3.50','General','2018-07-09 11:04:23','2018-07-11 11:11:56');
INSERT INTO grades VALUES('4','B','50.00','59.00','3.00','','2018-07-11 10:58:17','2018-07-11 11:09:04');
INSERT INTO grades VALUES('5','C','40.00','49.00','2.00','','2018-07-11 10:58:26','2018-07-11 11:09:12');
INSERT INTO grades VALUES('6','F','0.00','39.00','0.00','','2018-07-11 10:58:35','2018-07-11 10:58:35');



DROP TABLE IF EXISTS hostel_categories;

CREATE TABLE `hostel_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) NOT NULL,
  `standard` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostel_fee` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hostel_categories VALUES('1','1','High End','10.50','','2018-07-06 08:46:47','2018-07-06 08:52:02');



DROP TABLE IF EXISTS hostel_members;

CREATE TABLE `hostel_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `hostel_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS hostels;

CREATE TABLE `hostels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostel_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hostels VALUES('1','Hostel 1','Boys','Dhaka','','2018-07-06 08:46:38','2018-07-06 08:46:38');



DROP TABLE IF EXISTS invoice_items;

CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_items VALUES('9','1','1','150.00','0.00','2018-07-21 11:42:35','2018-07-21 11:42:35');
INSERT INTO invoice_items VALUES('10','1','2','100.00','0.00','2018-07-21 11:42:35','2018-07-21 11:42:35');
INSERT INTO invoice_items VALUES('11','2','1','150.00','0.00','2018-08-18 10:04:47','2018-08-18 10:04:47');
INSERT INTO invoice_items VALUES('12','3','1','150.00','0.00','2018-08-18 10:04:47','2018-08-18 10:04:47');
INSERT INTO invoice_items VALUES('13','4','1','150.00','0.00','2018-08-18 10:04:47','2018-08-18 10:04:47');



DROP TABLE IF EXISTS invoices;

CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `total` decimal(8,2) NOT NULL,
  `paid` decimal(8,2) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoices VALUES('1','2','1','1','1','2018-07-28','1st Term Invoice','','250.00','250.00','Paid','2018-07-20 16:16:36','2018-07-21 12:53:16');
INSERT INTO invoices VALUES('2','2','1','1','1','2018-08-25','Tuition Fee August 2018','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','150.00','','Unpaid','2018-08-18 10:04:47','2018-08-18 10:04:47');
INSERT INTO invoices VALUES('3','3','1','1','1','2018-08-25','Tuition Fee August 2018','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','150.00','150.00','Paid','2018-08-18 10:04:47','2018-09-04 07:09:24');
INSERT INTO invoices VALUES('4','4','1','1','1','2018-08-25','Tuition Fee August 2018','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','150.00','','Unpaid','2018-08-18 10:04:47','2018-08-18 10:04:47');



DROP TABLE IF EXISTS library_members;

CREATE TABLE `library_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `member_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO library_members VALUES('1','24','201853424','Student','2018-07-06 09:07:42','2018-07-06 09:07:42');
INSERT INTO library_members VALUES('2','26','201810226','Teacher','2018-09-14 08:50:58','2018-09-14 08:50:58');



DROP TABLE IF EXISTS mark_details;

CREATE TABLE `mark_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mark_id` int(11) NOT NULL,
  `mark_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark_value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO mark_details VALUES('10','3','Exam','66.00','2018-07-10 10:33:30','2018-07-11 08:58:05');
INSERT INTO mark_details VALUES('11','3','Attendance','10.00','2018-07-10 10:33:30','2018-07-10 10:33:30');
INSERT INTO mark_details VALUES('12','3','Lab Report','7.00','2018-07-10 10:33:30','2018-07-11 09:21:59');
INSERT INTO mark_details VALUES('13','4','Exam','60.00','2018-07-10 10:33:30','2018-07-10 10:33:30');
INSERT INTO mark_details VALUES('14','4','Attendance','9.00','2018-07-10 10:33:30','2018-07-10 10:33:30');
INSERT INTO mark_details VALUES('15','4','Lab Report','7.00','2018-07-10 10:33:30','2018-07-11 07:41:45');
INSERT INTO mark_details VALUES('16','5','Exam','80.00','2018-07-10 10:33:30','2018-07-12 15:30:16');
INSERT INTO mark_details VALUES('17','5','Attendance','8.00','2018-07-10 10:33:30','2018-07-10 10:33:30');
INSERT INTO mark_details VALUES('18','5','Lab Report','0.00','2018-07-10 10:33:30','2018-07-11 11:40:47');
INSERT INTO mark_details VALUES('19','3','Others','','2018-07-11 07:38:36','2018-07-11 12:20:41');
INSERT INTO mark_details VALUES('20','4','Others','','2018-07-11 07:38:36','2018-07-11 12:20:41');
INSERT INTO mark_details VALUES('21','5','Others','','2018-07-11 07:38:36','2018-07-11 12:20:41');
INSERT INTO mark_details VALUES('22','6','Exam','63.00','2018-07-11 08:02:36','2018-07-11 08:08:23');
INSERT INTO mark_details VALUES('23','6','Attendance','10.00','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO mark_details VALUES('24','6','Lab Report','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('25','6','Others','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('26','7','Exam','60.00','2018-07-11 08:02:36','2018-07-11 08:08:23');
INSERT INTO mark_details VALUES('27','7','Attendance','8.00','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO mark_details VALUES('28','7','Lab Report','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('29','7','Others','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('30','8','Exam','55.00','2018-07-11 08:02:36','2018-07-11 08:08:24');
INSERT INTO mark_details VALUES('31','8','Attendance','8.00','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO mark_details VALUES('32','8','Lab Report','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('33','8','Others','','2018-07-11 08:02:36','2018-07-11 12:20:07');
INSERT INTO mark_details VALUES('34','9','Exam','80.00','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO mark_details VALUES('35','9','Attendance','10.00','2018-07-11 08:09:17','2018-08-31 08:23:02');
INSERT INTO mark_details VALUES('36','9','Lab Report','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('37','9','Others','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('38','10','Exam','75.00','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO mark_details VALUES('39','10','Attendance','10.00','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO mark_details VALUES('40','10','Lab Report','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('41','10','Others','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('42','11','Exam','68.00','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO mark_details VALUES('43','11','Attendance','10.00','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO mark_details VALUES('44','11','Lab Report','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('45','11','Others','','2018-07-11 08:09:17','2018-07-11 12:20:24');
INSERT INTO mark_details VALUES('46','12','Exam','51.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('47','12','Attendance','10.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('48','12','Lab Report','6.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('49','12','Others','8.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('50','13','Exam','40.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('51','13','Attendance','8.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('52','13','Lab Report','5.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('53','13','Others','8.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('54','14','Exam','60.00','2018-07-11 08:10:00','2018-07-12 19:08:14');
INSERT INTO mark_details VALUES('55','14','Attendance','8.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('56','14','Lab Report','5.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('57','14','Others','8.00','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO mark_details VALUES('58','15','Exam','80.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('59','15','Attendance','10.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('60','15','Lab Report','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('61','15','Others','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('62','16','Exam','75.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('63','16','Attendance','10.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('64','16','Lab Report','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('65','16','Others','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('66','17','Exam','78.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('67','17','Attendance','10.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('68','17','Lab Report','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('69','17','Others','0.00','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO mark_details VALUES('70','18','Exam','65.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('71','18','Attendance','9.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('72','18','Lab Report','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('73','18','Others','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('74','19','Exam','55.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('75','19','Attendance','9.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('76','19','Lab Report','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('77','19','Others','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('78','20','Exam','60.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('79','20','Attendance','9.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('80','20','Lab Report','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('81','20','Others','0.00','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO mark_details VALUES('82','21','Exam','78.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('83','21','Attendance','8.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('84','21','Lab Report','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('85','21','Others','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('86','22','Exam','78.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('87','22','Attendance','8.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('88','22','Lab Report','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('89','22','Others','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('90','23','Exam','85.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('91','23','Attendance','8.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('92','23','Lab Report','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('93','23','Others','0.00','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO mark_details VALUES('94','24','Exam','50.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('95','24','Attendance','9.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('96','24','Lab Report','7.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('97','24','Others','7.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('98','25','Exam','50.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('99','25','Attendance','9.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('100','25','Lab Report','7.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('101','25','Others','7.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('102','26','Exam','61.00','2018-07-11 08:12:30','2018-07-12 19:08:25');
INSERT INTO mark_details VALUES('103','26','Attendance','9.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('104','26','Lab Report','8.00','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO mark_details VALUES('105','26','Others','7.00','2018-07-11 08:12:30','2018-07-11 08:12:30');



DROP TABLE IF EXISTS mark_distributions;

CREATE TABLE `mark_distributions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mark_distribution_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark_percentage` decimal(8,2) NOT NULL,
  `is_exam` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_active` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO mark_distributions VALUES('1','Exam','70.00','yes','yes','','2018-07-11 07:40:05');
INSERT INTO mark_distributions VALUES('2','Attendance','10.00','no','yes','2018-07-09 12:59:27','2018-07-09 17:53:22');
INSERT INTO mark_distributions VALUES('3','Lab Report','10.00','no','yes','2018-07-09 12:59:41','2018-07-09 17:39:03');
INSERT INTO mark_distributions VALUES('4','Others','10.00','no','yes','2018-07-10 17:10:13','2018-07-11 07:40:00');



DROP TABLE IF EXISTS marks;

CREATE TABLE `marks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO marks VALUES('3','6','2','1','1','1','2018-07-10 12:21:12','2018-07-10 12:21:12');
INSERT INTO marks VALUES('4','6','3','1','1','1','2018-07-10 12:21:12','2018-07-10 12:21:12');
INSERT INTO marks VALUES('5','6','4','1','1','1','2018-07-10 12:21:12','2018-07-10 12:21:12');
INSERT INTO marks VALUES('6','6','2','1','1','2','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO marks VALUES('7','6','3','1','1','2','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO marks VALUES('8','6','4','1','1','2','2018-07-11 08:02:36','2018-07-11 08:02:36');
INSERT INTO marks VALUES('9','6','2','1','1','3','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO marks VALUES('10','6','3','1','1','3','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO marks VALUES('11','6','4','1','1','3','2018-07-11 08:09:17','2018-07-11 08:09:17');
INSERT INTO marks VALUES('12','6','2','1','1','4','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO marks VALUES('13','6','3','1','1','4','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO marks VALUES('14','6','4','1','1','4','2018-07-11 08:10:00','2018-07-11 08:10:00');
INSERT INTO marks VALUES('15','7','2','1','1','1','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO marks VALUES('16','7','3','1','1','1','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO marks VALUES('17','7','4','1','1','1','2018-07-11 08:11:32','2018-07-11 08:11:32');
INSERT INTO marks VALUES('18','7','2','1','1','2','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO marks VALUES('19','7','3','1','1','2','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO marks VALUES('20','7','4','1','1','2','2018-07-11 08:11:48','2018-07-11 08:11:48');
INSERT INTO marks VALUES('21','7','2','1','1','3','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO marks VALUES('22','7','3','1','1','3','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO marks VALUES('23','7','4','1','1','3','2018-07-11 08:12:05','2018-07-11 08:12:05');
INSERT INTO marks VALUES('24','7','2','1','1','4','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO marks VALUES('25','7','3','1','1','4','2018-07-11 08:12:30','2018-07-11 08:12:30');
INSERT INTO marks VALUES('26','7','4','1','1','4','2018-07-11 08:12:30','2018-07-11 08:12:30');



DROP TABLE IF EXISTS messages;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO messages VALUES('1','2018-08-16 08:08:33','Test Teacher Message','<p>Test Teacher Message</p>','3','2018-08-16 08:54:33','2018-08-16 08:54:33');
INSERT INTO messages VALUES('2','2018-08-16 09:08:14','Student Message 1','<p>Student Message 1</p>','3','2018-08-16 09:14:14','2018-08-16 09:14:14');
INSERT INTO messages VALUES('3','2018-08-16 09:08:17','dfg dg dgdg','<p>dgd dfgd dgdfg</p>','1','2018-08-16 09:32:17','2018-08-16 09:32:17');
INSERT INTO messages VALUES('4','2018-08-16 10:08:16','Address Table','<p>Check The Table&nbsp;</p><table class=\"table table-bordered\"><tbody><tr><td><b>Name</b></td><td><b>Email</b></td><td><b>Address</b></td></tr><tr><td>Francis</td><td>francis@gmail.com</td><td>Dhaka,Bangladesh</td></tr><tr><td>Kennedy</td><td>kennedy@gmail.com<br></td><td>Dhaka,Bangladesh<br></td></tr></tbody></table><p>Regards</br>Francis</br>Admin</p>','3','2018-08-16 10:23:16','2018-08-16 10:23:16');
INSERT INTO messages VALUES('5','2018-08-16 10:08:29','sdgdg','<p>dgdfg</p>','3','2018-08-16 10:35:29','2018-08-16 10:35:29');
INSERT INTO messages VALUES('6','2018-08-16 10:08:16','sdfsdf','<p>sdfsdf</p>','3','2018-08-16 10:36:16','2018-08-16 10:36:16');
INSERT INTO messages VALUES('7','2018-08-16 10:08:36','sdfsdf','<p>sdfsdfsdfsdf</p>','3','2018-08-16 10:36:36','2018-08-16 10:36:36');
INSERT INTO messages VALUES('8','2018-08-29 17:08:39','Need New Permission','<p>I need Permission for <span style=\"color: rgb(255, 0, 0);\">removing book category</span>. Please give that permission.</p><p><br></p><p>Regards Bablu</p>','27','2018-08-29 17:23:39','2018-08-29 17:23:39');
INSERT INTO messages VALUES('9','2018-08-30 07:08:45','Hi, Your account is ready to use','<p>Hi, Your account is ready to use<br></p>','3','2018-08-30 07:05:45','2018-08-30 07:05:45');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('16','2018_05_18_195749_create_classes_table','2');
INSERT INTO migrations VALUES('17','2018_05_18_195820_create_sections_table','2');
INSERT INTO migrations VALUES('18','2018_05_19_190218_create_teachers_table','2');
INSERT INTO migrations VALUES('19','2018_05_19_190305_create_parents_table','2');
INSERT INTO migrations VALUES('20','2018_05_23_191505_create_students_table','2');
INSERT INTO migrations VALUES('21','2018_05_26_152356_create_subjects_table','3');
INSERT INTO migrations VALUES('22','2018_05_26_152500_create_assign_subjects_table','3');
INSERT INTO migrations VALUES('23','2018_05_30_171511_create_syllabus_table','4');
INSERT INTO migrations VALUES('24','2018_05_30_171640_create_assignments_table','4');
INSERT INTO migrations VALUES('27','2018_05_31_173434_create_student_groups_table','5');
INSERT INTO migrations VALUES('28','2018_05_31_160819_create_academic_years_table','6');
INSERT INTO migrations VALUES('29','2018_06_01_080940_create_settings_table','7');
INSERT INTO migrations VALUES('30','2018_06_01_161632_create_picklists_table','8');
INSERT INTO migrations VALUES('31','2018_06_03_135117_create_student_sessions_table','9');
INSERT INTO migrations VALUES('38','2018_06_04_173837_create_class_days_table','11');
INSERT INTO migrations VALUES('39','2018_06_04_113731_create_class_routines_table','12');
INSERT INTO migrations VALUES('40','2018_06_05_104953_create_custom_fields_table','13');
INSERT INTO migrations VALUES('41','2018_06_04_064956_create_student_attendances_table','14');
INSERT INTO migrations VALUES('42','2018_06_04_065009_create_teacher_attendances_table','14');
INSERT INTO migrations VALUES('53','2018_06_11_141814_create_library_members_table','15');
INSERT INTO migrations VALUES('54','2018_06_14_070134_create_books_table','15');
INSERT INTO migrations VALUES('55','2018_06_14_175650_create_book_issues_table','15');
INSERT INTO migrations VALUES('56','2018_06_24_101833_create_book_categories_table','15');
INSERT INTO migrations VALUES('57','2018_06_29_052036_create_transports_table','15');
INSERT INTO migrations VALUES('58','2018_06_29_081124_create_transport_members_table','15');
INSERT INTO migrations VALUES('59','2018_06_29_155533_create_hostels_table','15');
INSERT INTO migrations VALUES('60','2018_06_29_184315_create_hostel_categories_table','15');
INSERT INTO migrations VALUES('61','2018_06_30_180121_create_hostel_members_table','15');
INSERT INTO migrations VALUES('62','2018_07_03_181135_create_transport_vehicles_table','15');
INSERT INTO migrations VALUES('66','2018_07_08_081225_create_exams_table','16');
INSERT INTO migrations VALUES('67','2018_07_08_100441_create_exam_schedules_table','17');
INSERT INTO migrations VALUES('68','2018_07_09_074555_create_exam_attendances_table','18');
INSERT INTO migrations VALUES('69','2018_07_09_105314_create_grades_table','19');
INSERT INTO migrations VALUES('71','2018_07_09_122620_create_mark_distributions_table','20');
INSERT INTO migrations VALUES('72','2018_07_10_104623_create_marks_table','21');
INSERT INTO migrations VALUES('73','2018_07_10_105637_create_mark_details_table','21');
INSERT INTO migrations VALUES('74','2018_07_13_140956_create_bank_cash_accounts_table','22');
INSERT INTO migrations VALUES('75','2018_07_13_145607_create_chart_of_accounts_table','23');
INSERT INTO migrations VALUES('76','2018_07_13_155644_create_payment_methods_table','24');
INSERT INTO migrations VALUES('77','2018_07_13_155757_create_payee_payers_table','24');
INSERT INTO migrations VALUES('78','2018_07_13_163829_create_transactions_table','25');
INSERT INTO migrations VALUES('79','2018_07_14_080436_create_fee_types_table','26');
INSERT INTO migrations VALUES('80','2018_06_04_065009_create_staff_attendances_table','27');
INSERT INTO migrations VALUES('81','2018_07_20_071630_create_invoices_table','27');
INSERT INTO migrations VALUES('82','2018_07_20_071647_create_invoice_items_table','27');
INSERT INTO migrations VALUES('83','2018_07_21_114336_create_student_payments_table','28');
INSERT INTO migrations VALUES('86','2018_08_16_080154_create_messages_table','29');
INSERT INTO migrations VALUES('87','2018_08_16_080216_create_user_messages_table','29');
INSERT INTO migrations VALUES('88','2018_08_17_171611_create_sms_logs_table','30');
INSERT INTO migrations VALUES('89','2018_08_17_171623_create_email_logs_table','30');
INSERT INTO migrations VALUES('90','2018_08_29_084045_create_permission_roles_table','31');
INSERT INTO migrations VALUES('91','2018_08_29_084110_create_permissions_table','31');
INSERT INTO migrations VALUES('92','2018_09_03_094539_create_notices_table','32');
INSERT INTO migrations VALUES('93','2018_09_03_102813_create_user_notices_table','33');
INSERT INTO migrations VALUES('94','2018_09_04_164515_create_posts_table','34');
INSERT INTO migrations VALUES('95','2018_09_04_164546_create_post_contents_table','34');
INSERT INTO migrations VALUES('98','2018_09_04_175517_create_website_languages_table','35');
INSERT INTO migrations VALUES('99','2018_09_05_070003_create_post_categories_table','36');
INSERT INTO migrations VALUES('100','2018_09_04_164612_create_pages_table','37');
INSERT INTO migrations VALUES('101','2018_09_04_164646_create_page_contents_table','37');
INSERT INTO migrations VALUES('102','2018_09_07_160425_create_site_navigations_table','38');
INSERT INTO migrations VALUES('103','2018_09_07_161052_create_site_navigation_items_table','38');
INSERT INTO migrations VALUES('104','2018_09_09_081510_create_events_table','39');



DROP TABLE IF EXISTS notices;

CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notices VALUES('1','প্রথম বিশ্বযুদ্ধের কারণ','<p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\"><a href=\"https://bn.wikipedia.org/wiki/%E0%A7%A7%E0%A7%AF%E0%A7%A7%E0%A7%AA\" title=\"\" style=\"text-decoration-line: underline; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">১৯১৪</a>&nbsp;সালের&nbsp;<a href=\"https://bn.wikipedia.org/wiki/%E0%A7%A8%E0%A7%AE%E0%A6%B6%E0%A7%87_%E0%A6%9C%E0%A7%81%E0%A6%A8\" class=\"mw-redirect\" title=\"২৮শে জুন\" style=\"color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">২৮শে জুন</a>&nbsp;অস্ট্রো-হাঙ্গেরীয় সাম্রাজ্যের উত্তরাধিকারী আর্চডিউক ফ্রাঞ্জ ফার্দিনান্দের হত্যাকান্ডের মাধ্যমে প্রথম বিশ্বযুদ্ধের সূত্রপাত হয়। হত্যাকারী ছিলেন অস্ট্রো-হাঙ্গেরীয় নাগরিক, কিন্ত জাতিতে বসনীয় সার্ব। সে সময়&nbsp;<a href=\"https://bn.wikipedia.org/wiki/%E0%A6%AC%E0%A6%B8%E0%A6%A8%E0%A6%BF%E0%A6%AF%E0%A6%BC%E0%A6%BE\" class=\"mw-redirect\" title=\"বসনিয়া\" style=\"color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">বসনিয়া</a>&nbsp;ছিলো সাম্রাজ্যটির অংশ। গাভরিলো প্রিন্সিপ নামের ছাত্রটি ছিলেন \'তরুণ বসনিয়া\' দলের সদস্য, অস্ট্রো-হাঙ্গেরী শাসন থেকে মুক্তি যাদের লক্ষ্য। ঘটনাটি ঘটে&nbsp;<a href=\"https://bn.wikipedia.org/wiki/%E0%A6%AC%E0%A6%B8%E0%A6%A8%E0%A6%BF%E0%A6%AF%E0%A6%BC%E0%A6%BE\" class=\"mw-redirect\" title=\"বসনিয়া\" style=\"color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">বসনিয়ার</a>&nbsp;রাজধানী&nbsp;<a href=\"https://bn.wikipedia.org/wiki/%E0%A6%B8%E0%A6%BE%E0%A6%B0%E0%A6%BE%E0%A6%AF%E0%A6%BC%E0%A7%87%E0%A6%AD%E0%A7%8B\" title=\"সারায়েভো\" style=\"color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">সারায়েভোতে</a>। অস্ট্রো-হাঙ্গেরীয় সাম্রাজ্য সার্বিয়াকে যথাযথ ব্যবস্থা নিতে আহ্বান জানায়।</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">সে যুগে আন্তর্জাতিক সম্পর্ক ছিলো গোপনীয়তায় ভরা ও জটিল । ফ্রান্সের ঐতিহাসিক শত্রুতার কারণে ব্রিটেন প্রথমদিকে জার্মানীর প্রতি বন্ধুভাবাপন্ন ছিলো। কিন্ত জার্মানী ব্রিটেনের সাথে নৌ- প্রযুক্তিতে পাল্লা দিতে শুরু করায় সম্পর্কটি প্রতিযোগিতামূলক হয়ে ওঠে।</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">ফ্র্যাঙ্কো-প্রুশিয়ান যুদ্ধের পর থেকে জার্মান ও ফরাসিদের সম্পর্ক খারাপ হতে থাকে। ফরাসিরা তাই রাশিয়ার সাথে মৈত্রী করে। অস্ট্রিয়া-হাঙ্গেরী রাশিয়াকে হুমকি হিসেবে দেখতো, তাই তারা জার্মানীর সাথে মৈত্রী চুক্তি করে।</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">সার্বিয়ার উত্থানের সাথে সাথে স্লাভ জাতীয়তাবাদ জোরদার হয়ে ওঠে। সুযোগ পেয়ে এবার অস্ট্রিয়া-হাঙ্গেরী সার্বিয়াকে কোণঠাসা করে ফেলে। সার্বিয়ার মিত্র রাশিয়া, সে জোরে সার্বিয়া হুমকি অগ্রাহ্য করবার সাহস দেখায় ও সৈন্য সমাবেশ শুরু করে। বিভিন্ন মৈত্রী চুক্তি, দুর্বল যোগাযোগ ব্যবস্থা ও বিভিন্ন পর্যায়ে সত্যের বিভিন্ন বিকৃতি রাষ্ট্রনায়কদের যুদ্ধের সিদ্ধান্তের দিকে ঠেলে দেয়।</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">২৮ জুলাই ১৯১৪ অস্ট্রিয়া-হাঙ্গেরী সার্বিয়ার সাথে যুদ্ধ ঘোষণা করে। পরদিন রাশিয়া সৈন্য সমাবেশের মাধ্যমে যুদ্ধে জড়িয়ে পড়ে। ফলে জার্মানীও যুদ্ধের জন্য প্রস্তুত হয়। এদিকে সার্বিয়ার সমর্থনে ফ্রান্স সৈন্য সমাবেশ শুরু করে। যুবরাজের হত্যার পর, জার্মানীর হিসাবে ছিল যে, সার্বিয়ার বিরুদ্ধে একটি সংক্ষিপ্ত, আঞ্চলিক যুদ্ধে বিজয়ের সম্ভাবনা আছে। তাই তারা অস্ট্রিয়াকে যেভাবে ইচ্ছা সেভাবে সার্বিয়ায় হামলা করার অনুমুতি দিয়ে দেয়। যা হয় বিরাট ভুল!</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">জার্মানী অস্ট্রিয়াকে নজিরবিহীন সমর্থন দেয়ায় ভবিষ্যৎ জার্মান শক্তি\'র সম্ভাবনায় আতঙ্কিত ফ্রান্স এবং রাশিয়ার তরফ থেকে অনাকাঙ্খিত শত্রুতা ডেকে আনে! রাশিয়া এবং ফ্রান্স সাথে সাথে যুদ্ধে যোগ দিলেও জার্মানী তাদের ভালই মোকাবেলা করছিল, কিন্তু ব্রিটেনের চোখে রাশিয়া এবং ফ্রান্সের তুলনায় একটি নতুন ও শক্তিশালী জার্মানী ছিল বড় হুমকী তাই তারা পূর্বের চুক্তি অনুযায়ী ও নিজেদের ক্ষমতার সুরক্ষিত করার জন্যই জার্মানীর বিপক্ষে যুদ্ধ ঘোষণা করে দেয়। ব্রিটেনের মত পরাশক্তির আগমন জার্মানীর জন্য ব্যাপক হুমকী হয়ে দাড়ায়! আভ্যন্তরীন রাজনৈতিক পরিবর্তনের মাঝেই রাশিয়া পরাজিত হয়ে যুদ্ধত্যাগ করে। ব্যাপক সৈন্য ও সম্পদের ক্ষয়-ক্ষতি ও কম্যুনিস্ট প্রোপাগান্ডাই সম্রাটের পতন ও রাশান পরাজয় নিশ্চিত করে! ইতোমধ্যেই ৩ বছর ধরে চলা যুদ্ধে এবং শীতকালে রাশিয়ার অভ্যন্তরে আক্রমণ করে ব্যাপক ক্ষতির শিকার জার্মান সেনাবাহিনী অদুরদর্শীতার পরিচয় দেয় আমেরিকান জাহাজে আক্রমণ করে! জার্মান নৌ-বাহিনীর আক্রমণ ঘুমন্ত দৈত্য যুক্তরাষ্ট্রকে যুদ্ধে ডেকে এনে চুড়ান্ত জার্মান পরাজয় নিশ্চিত করে! ( এমন স্ট্র‌্যাটেজিক ভুল জার্মানদের দ্বারাই সম্ভব তা আবারো প্রমানিত হয় ২য় বিশ্বযুদ্ধে )</p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; line-height: inherit; color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">এছাড়া শিল্পন্নোয়নের জন্য প্রয়োজনীয় কাঁচামাল সংগ্রহের লক্ষ্যে বিশ্বজুড়ে নব্য সাম্রাজ্য প্রতিষ্ঠার স্বপ্ন দেখা জার্মানীর উত্থান ফ্রান্স, ব্রিটেনের সাম্রাজ্যের জন্য নিশ্চিত হুমকি ছিল এবং এটা ঠেকানোর জন্যই ফ্রান্স-রাশিয়া-ব্রিটেন এবং সবশেষে যুক্তরাষ্ট্র একজোট হয়! এবং ৪ বছর ধরে চলা ব্যাপক ক্ষয়-ক্ষতি নিশ্চিতের পর হাবসবুর্গ (অস্ট্রিয়ান) অটোমান (তুর্কিশ) এবং রোমানভ (রাশিয়ান) সাম্রাজ্যের মত ৩ টা শতাব্দী প্রাচীন একসময়ের প্রবল আধিপত্য বিস্তারকারী সাম্রাজ্যের পতন নিশ্চিতকারী পরজয় ভাগ্যে জুটে! এবং নিজেদের আড়াল করার নীতি থেকে সরে এসে যুদ্ধের শেষ দিকে যোগ দিয়েই মুল নায়কের আসনে বসে যায় মার্কিন যুক্তরাষ্ট্র! এবং প্রেসিডেন্ট উইলসনের নেতৃত্ব শুরু হয় দুনিয়ায় নতুন ধরনের রাজনীতি!কিন্তু যুদ্ধের পর পর সবাই যখন ভাবছিল যে এমন মানবসৃষ্ঠ দুর্যোগের আর পূনরাবৃত্তি ঘটবে না তখনই তৎকালীন বিজয়ী ও পরাজিত শক্তিগুলো এমন সব কান্ড করতে থাকে যা সদ্য সমাপ্ত যুদ্ধের চেয়ে ভয়াবহ এবং দুনিয়ার ইতিহাসে সবচেয়ে বেশী ক্ষতিকর ২য় বিশ্বযুদ্ধের প্রেক্ষাপট তৈরী করছিল!!!!</p>','2018-09-03 10:34:45','2018-09-03 10:54:52');
INSERT INTO notices VALUES('2','Notice for Website','<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>','2018-09-10 17:17:30','2018-09-10 17:17:30');
INSERT INTO notices VALUES('3','Lorem Ipsum is simply dummy text of the printing and typesetting industry','<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>','2018-09-12 07:57:05','2018-09-12 07:57:05');
INSERT INTO notices VALUES('4','Notice for admin','<p>Notice for admin<br></p>','2018-09-12 16:34:58','2018-09-12 16:34:58');



DROP TABLE IF EXISTS page_contents;

CREATE TABLE `page_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `page_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `seo_meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_meta_description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO page_contents VALUES('10','5','Home','<!-- Why us -->

<div id=\"why-us\" class=\"section\">



	<!-- container -->

	<div class=\"container\">



		<!-- row -->

		<div class=\"row\">

			<div class=\"section-header text-center\">

				<h2>Why AppsVan</h2>

				<p class=\"lead\">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>

			</div>



			<!-- feature -->

			<div class=\"col-md-4\">

				<div class=\"feature\">

					<i class=\"feature-icon fa fa-flask\"></i>

					<div class=\"feature-content\">

						<h4>Online Courses</h4>

						<p>Ceteros fuisset mei no, soleat epicurei adipiscing ne vis. Et his suas veniam nominati.</p>

					</div>

				</div>

			</div>

			<!-- /feature -->



			<!-- feature -->

			<div class=\"col-md-4\">

				<div class=\"feature\">

					<i class=\"feature-icon fa fa-users\"></i>

					<div class=\"feature-content\">

						<h4>Expert Teachers</h4>

						<p>Ceteros fuisset mei no, soleat epicurei adipiscing ne vis. Et his suas veniam nominati.</p>

					</div>

				</div>

			</div>

			<!-- /feature -->



			<!-- feature -->

			<div class=\"col-md-4\">

				<div class=\"feature\">

					<i class=\"feature-icon fa fa-comments\"></i>

					<div class=\"feature-content\">

						<h4>Community</h4>

						<p>Ceteros fuisset mei no, soleat epicurei adipiscing ne vis. Et his suas veniam nominati.</p>

					</div>

				</div>

			</div>

			<!-- /feature -->



		</div>

		<!-- /row -->



	</div>

	<!-- /container -->



</div>

<!-- /Why us -->','','school,appsvan','Apps van School','english','2018-09-07 17:14:42','2018-09-12 09:01:08');
INSERT INTO page_contents VALUES('11','5','Home','','','','','Bangla','2018-09-07 17:14:42','2018-09-07 17:14:42');
INSERT INTO page_contents VALUES('12','5','Home','','','','','French','2018-09-07 17:14:42','2018-09-07 17:14:42');
INSERT INTO page_contents VALUES('13','6','News','','','','','english','2018-09-09 07:19:09','2018-09-09 17:08:43');
INSERT INTO page_contents VALUES('14','7','Our Faculty','','','','','english','2018-09-11 07:35:27','2018-09-11 07:35:27');
INSERT INTO page_contents VALUES('15','8','School History','<h2>About Our School</h2>
<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

<h2>Where does it come from?</h2>
<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>

<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','','','','english','2018-09-11 07:37:15','2018-09-11 07:37:15');
INSERT INTO page_contents VALUES('16','9','Notice','','','','','english','2018-09-12 07:46:48','2018-09-12 07:46:48');
INSERT INTO page_contents VALUES('17','10','Event','','','','','english','2018-09-12 08:06:51','2018-09-12 08:06:51');
INSERT INTO page_contents VALUES('18','11','Contact','','','','','english','2018-09-12 08:19:47','2018-09-12 08:19:47');



DROP TABLE IF EXISTS pages;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pages VALUES('5','home','publish','default','','3','2018-09-07 17:14:42','2018-09-07 17:14:42');
INSERT INTO pages VALUES('6','news','publish','blog','','3','2018-09-09 07:19:09','2018-09-11 07:34:36');
INSERT INTO pages VALUES('7','our_faculty','publish','teachers','','3','2018-09-11 07:35:27','2018-09-11 07:35:27');
INSERT INTO pages VALUES('8','school_history','publish','general','','3','2018-09-11 07:37:15','2018-09-11 07:48:00');
INSERT INTO pages VALUES('9','notice','publish','notice','','3','2018-09-12 07:46:48','2018-09-12 07:49:45');
INSERT INTO pages VALUES('10','event','publish','event','','3','2018-09-12 08:06:51','2018-09-12 08:06:51');
INSERT INTO pages VALUES('11','contact','publish','contact','','3','2018-09-12 08:19:47','2018-09-12 08:19:47');



DROP TABLE IF EXISTS parents;

CREATE TABLE `parents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_profession` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_profession` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO parents VALUES('1','15','Mr Mathew','Mr Jhon','Mrs Sonia','Driver','Housewife','','','2018-05-25 08:22:32','2018-05-25 08:22:32');
INSERT INTO parents VALUES('4','20','Hubart Gomes','Hubart Gomes','Shally Gomes','','','','','2018-06-02 18:23:54','2018-06-02 18:23:54');



DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES('kennedyrodrick93@gmail.com','$2y$10$NlLS.QGWJS1QqGfG9IBOjeeveZO.D6JJJPy0J7Cn2QtCgNFXk41qO','2018-09-03 08:19:03');



DROP TABLE IF EXISTS payee_payers;

CREATE TABLE `payee_payers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payee_payers VALUES('1','Payer 1','payer','','2018-07-13 16:17:04','2018-07-13 16:17:04');
INSERT INTO payee_payers VALUES('2','Payer 2','payer','','2018-07-13 16:17:11','2018-07-13 16:17:11');
INSERT INTO payee_payers VALUES('3','Payee 1','payee','','2018-07-13 16:17:15','2018-07-13 18:17:37');
INSERT INTO payee_payers VALUES('4','Payee 2','payee','','2018-07-13 16:17:30','2018-07-13 16:17:30');



DROP TABLE IF EXISTS payment_methods;

CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_methods VALUES('1','Cash','2018-07-13 16:03:45','2018-07-13 16:03:45');
INSERT INTO payment_methods VALUES('2','Cheque','2018-07-13 16:04:03','2018-07-13 16:04:03');
INSERT INTO payment_methods VALUES('3','PayPal','2018-07-13 16:04:13','2018-07-13 16:04:13');



DROP TABLE IF EXISTS permission_roles;

CREATE TABLE `permission_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permission_roles VALUES('3','Librarian Role','','2018-08-29 08:53:59','2018-08-29 11:00:25');
INSERT INTO permission_roles VALUES('4','Accountant Role','','2018-08-29 08:54:08','2018-09-03 09:39:41');



DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('80','3','students.view_id_card','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('81','3','students.index','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('82','3','students.show','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('83','3','librarymembers.view_library_card','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('84','3','librarymembers.index','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('85','3','librarymembers.create','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('86','3','librarymembers.show','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('87','3','librarymembers.destroy','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('88','3','books.index','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('89','3','books.create','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('90','3','books.show','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('91','3','books.edit','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('92','3','books.destroy','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('93','3','bookissues.index','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('94','3','bookissues.return','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('95','3','bookissues.create','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('96','3','bookissues.show','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('97','3','bookissues.edit','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('98','3','bookissues.destroy','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('99','3','bookcategories.index','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('100','3','bookcategories.create','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('101','3','bookcategories.show','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('102','3','bookcategories.edit','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('103','3','bookcategories.destroy','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('104','3','message.compose','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('105','3','message.view_outbox','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('106','3','message.view_inbox','2018-08-29 17:40:38','2018-08-29 17:40:38');
INSERT INTO permissions VALUES('110','4','accounts.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('111','4','accounts.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('112','4','accounts.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('113','4','accounts.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('114','4','accounts.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('115','4','chart_of_accounts.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('116','4','chart_of_accounts.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('117','4','chart_of_accounts.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('118','4','chart_of_accounts.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('119','4','chart_of_accounts.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('120','4','payment_methods.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('121','4','payment_methods.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('122','4','payment_methods.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('123','4','payment_methods.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('124','4','payment_methods.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('125','4','payee_payers.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('126','4','payee_payers.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('127','4','payee_payers.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('128','4','payee_payers.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('129','4','payee_payers.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('130','4','transactions.manage_income','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('131','4','transactions.manage_expense','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('132','4','transactions.add_income','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('133','4','transactions.add_expense','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('134','4','transactions.store','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('135','4','transactions.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('136','4','transactions.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('137','4','transactions.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('138','4','fee_types.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('139','4','fee_types.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('140','4','fee_types.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('141','4','fee_types.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('142','4','fee_types.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('143','4','invoices.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('144','4','invoices.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('145','4','invoices.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('146','4','invoices.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('147','4','invoices.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('148','4','student_payments.create','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('149','4','student_payments.index','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('150','4','student_payments.show','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('151','4','student_payments.edit','2018-09-14 09:00:29','2018-09-14 09:00:29');
INSERT INTO permissions VALUES('152','4','student_payments.destroy','2018-09-14 09:00:29','2018-09-14 09:00:29');



DROP TABLE IF EXISTS picklists;

CREATE TABLE `picklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO picklists VALUES('2','Religion','Christian','2018-06-01 17:08:11','2018-06-01 17:13:19');
INSERT INTO picklists VALUES('3','Religion','Hindu','2018-06-01 17:08:18','2018-06-01 17:08:18');
INSERT INTO picklists VALUES('4','Designation','English Teacher','2018-06-01 17:13:33','2018-06-01 17:13:33');
INSERT INTO picklists VALUES('5','Designation','Math Teacher','2018-06-01 17:16:41','2018-06-01 17:16:41');
INSERT INTO picklists VALUES('6','Designation','Sports Teacher','2018-06-01 17:16:56','2018-06-02 07:39:29');
INSERT INTO picklists VALUES('7','Religion','Muslim','2018-06-02 10:55:33','2018-06-02 10:55:52');



DROP TABLE IF EXISTS post_categories;

CREATE TABLE `post_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trans_category` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO post_categories VALUES('1','News','','','post','','2018-09-05 07:23:52','2018-09-05 07:23:52');
INSERT INTO post_categories VALUES('2','Health','','','post','','2018-09-05 07:32:41','2018-09-05 07:32:41');
INSERT INTO post_categories VALUES('3','Sports','a:2:{s:6:\"Bangla\";s:24:\"খেলাধুলা\";s:6:\"French\";s:10:\"Des sports\";}','','post','','2018-09-05 07:38:54','2018-09-05 11:33:19');
INSERT INTO post_categories VALUES('4','Cricket','','','post','3','2018-09-05 07:39:02','2018-09-05 07:39:02');
INSERT INTO post_categories VALUES('5','Football','','','post','3','2018-09-05 07:39:08','2018-09-05 07:39:08');
INSERT INTO post_categories VALUES('8','Test Category','a:2:{s:6:\"Bangla\";s:23:\"Test Category In Bangla\";s:6:\"French\";s:23:\"Test Category In French\";}','','post','','2018-09-05 11:28:03','2018-09-09 07:25:18');
INSERT INTO post_categories VALUES('9','Others','','','post','','2018-09-09 07:23:07','2018-09-09 07:23:20');



DROP TABLE IF EXISTS post_contents;

CREATE TABLE `post_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO post_contents VALUES('1','1','What is Lorem Ipsum?','<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>','','english','2018-09-10 17:13:07','2018-09-10 17:13:07');
INSERT INTO post_contents VALUES('2','2','Why do we use it?','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>','','english','2018-09-10 17:13:19','2018-09-11 07:23:37');
INSERT INTO post_contents VALUES('3','3','Where does it come from?','<h1>Heading 1</h1><p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p><h1><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Heading 2</span></h1><p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span></p><h4><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Heading 3</span></h4><p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>','','english','2018-09-10 17:13:31','2018-09-11 07:28:26');
INSERT INTO post_contents VALUES('4','4','Where can I get some?','<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span><br></p>','','english','2018-09-10 17:13:42','2018-09-10 17:13:42');



DROP TABLE IF EXISTS posts;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES('1','what_is_lorem_ipsum','post','publish','','0','3','2018-09-10 17:13:07','2018-09-10 17:13:07');
INSERT INTO posts VALUES('2','why_do_we_use_it','post','publish','','0','3','2018-09-10 17:13:19','2018-09-10 17:13:19');
INSERT INTO posts VALUES('3','where_does_it_come_from','post','publish','','0','3','2018-09-10 17:13:31','2018-09-10 17:13:31');
INSERT INTO posts VALUES('4','where_can_i_get_some','post','publish','','1','3','2018-09-10 17:13:42','2018-09-12 10:03:34');



DROP TABLE IF EXISTS sections;

CREATE TABLE `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `class_teacher_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `rank` int(2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sections VALUES('1','A','34','1','1','1','1','2','2018-05-25 08:21:39','2018-07-12 14:35:05');
INSERT INTO sections VALUES('2','B','35','1','2','1','2','2','2018-05-25 10:35:40','2018-06-04 08:21:07');
INSERT INTO sections VALUES('3','A','36','2','3','1','1','2','2018-07-12 18:54:09','2018-09-14 09:28:58');
INSERT INTO sections VALUES('4','B','37','2','4','1','2','50','2018-07-12 18:54:18','2018-07-12 18:54:18');



DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('2','site_title','AppsVan School','2018-06-01 08:44:31','2018-09-08 07:58:21');
INSERT INTO settings VALUES('3','school_name','AppsVan School','2018-06-01 08:58:41','2018-09-08 07:58:21');
INSERT INTO settings VALUES('4','academic_year','1','2018-06-01 08:58:41','2018-09-14 09:31:27');
INSERT INTO settings VALUES('5','phone','+88018646546','2018-06-01 10:01:19','2018-09-08 07:58:21');
INSERT INTO settings VALUES('6','email','info@appsvan.com','2018-06-01 10:01:19','2018-09-08 07:58:21');
INSERT INTO settings VALUES('7','timezone','Asia/Dhaka','2018-06-01 10:01:19','2018-09-08 07:58:21');
INSERT INTO settings VALUES('8','currency_symbol','$','2018-07-06 08:39:26','2018-09-08 07:58:21');
INSERT INTO settings VALUES('9','address','Dhaka, Bangladesh','2018-07-20 14:29:49','2018-09-08 07:58:21');
INSERT INTO settings VALUES('10','mail_type','mail','2018-08-16 11:28:54','2018-08-17 18:56:37');
INSERT INTO settings VALUES('11','from_email','info@trickycode.net','2018-08-16 11:28:54','2018-08-17 18:56:37');
INSERT INTO settings VALUES('12','from_name','TrickyCode','2018-08-16 11:28:54','2018-08-17 18:56:37');
INSERT INTO settings VALUES('13','smtp_host','server82.web-hosting.com','2018-08-16 11:28:54','2018-08-17 18:56:30');
INSERT INTO settings VALUES('14','smtp_port','465','2018-08-16 11:28:54','2018-08-17 18:56:30');
INSERT INTO settings VALUES('15','smtp_username','info@trickycode.net','2018-08-16 11:28:54','2018-08-17 18:56:30');
INSERT INTO settings VALUES('16','smtp_password','123456','2018-08-16 11:28:54','2018-08-17 18:56:30');
INSERT INTO settings VALUES('17','smtp_encryption','ssl','2018-08-17 18:03:25','2018-08-17 18:56:30');
INSERT INTO settings VALUES('18','logo','logo.png','2018-09-03 08:52:11','2018-09-03 08:54:45');
INSERT INTO settings VALUES('19','paypal_active','Yes','2018-09-03 16:35:43','2018-09-04 06:47:14');
INSERT INTO settings VALUES('20','paypal_email','agustinwebpaypal@gmail.com','2018-09-03 16:35:43','2018-09-04 06:47:14');
INSERT INTO settings VALUES('21','stripe_active','Yes','2018-09-03 16:35:43','2018-09-04 06:47:14');
INSERT INTO settings VALUES('22','stripe_secret_key','sk_test_IJV5nuduGwVdBtihsCIubC5f','2018-09-03 16:35:43','2018-09-04 06:47:14');
INSERT INTO settings VALUES('23','stripe_publishable_key','pk_test_TiUY1pFP2M1rCe6xwlwu9SiS','2018-09-03 16:35:43','2018-09-04 06:47:14');
INSERT INTO settings VALUES('24','paypal_currency','USD','2018-09-03 17:11:51','2018-09-04 06:47:14');
INSERT INTO settings VALUES('25','stripe_currency','USD','2018-09-04 06:47:09','2018-09-04 06:47:14');
INSERT INTO settings VALUES('26','active_theme','default','2018-09-08 07:58:21','2018-09-08 07:58:21');
INSERT INTO settings VALUES('27','custom_css','','2018-09-08 08:33:35','2018-09-08 08:34:41');
INSERT INTO settings VALUES('28','custom_js','','2018-09-08 08:34:52','2018-09-08 08:36:35');
INSERT INTO settings VALUES('29','copyright_text','&copy; Copyright 2018. All Rights Reserved. | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a href=\"https://colorlib.com\">Colorlib</a>','2018-09-09 07:43:58','2018-09-11 06:25:41');
INSERT INTO settings VALUES('37','slider','a:4:{s:14:\"slider_heading\";a:3:{i:0;s:20:\"What is Lorem Ipsum?\";i:1;s:24:\"Where does it come from?\";i:2;s:17:\"Why do we use it?\";}s:14:\"slider_content\";a:3:{i:0;s:75:\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. \";i:1;s:163:\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\";i:2;s:124:\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\";}s:11:\"button_link\";a:3:{i:0;s:1:\"#\";i:1;s:1:\"#\";i:2;s:0:\"\";}s:11:\"button_text\";a:3:{i:0;s:11:\"Get Started\";i:1;s:11:\"Explore Now\";i:2;s:0:\"\";}}','2018-09-09 18:12:10','2018-09-12 09:05:17');
INSERT INTO settings VALUES('38','home_page','5','2018-09-10 17:05:59','2018-09-11 06:25:41');
INSERT INTO settings VALUES('39','disabled_website','no','2018-09-10 17:07:23','2018-09-11 06:25:41');
INSERT INTO settings VALUES('40','facebook_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('41','twitter_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('42','google_plus_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('43','instagram_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('44','youtube_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('45','linkedin_link','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('46','contact_email','appsvan2014@gmail.com','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('47','contact_phone','154-454-5464-45','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('48','google_map_api','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('49','google_map_latitude','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('50','google_map_longitude','','2018-09-12 08:17:43','2018-09-12 08:19:23');
INSERT INTO settings VALUES('51','contact_address','Dhaka, Bangladesh','2018-09-12 08:19:23','2018-09-12 08:19:23');



DROP TABLE IF EXISTS site_navigation_items;

CREATE TABLE `site_navigation_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_id` int(11) NOT NULL,
  `menu_label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `page_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_order` int(11) NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO site_navigation_items VALUES('12','1','Home','','5','0','','','1','2018-09-08 07:31:36','2018-09-08 07:33:45');
INSERT INTO site_navigation_items VALUES('13','1','About','#','','0','','','2','2018-09-08 07:31:59','2018-09-08 07:33:45');
INSERT INTO site_navigation_items VALUES('14','1','Our Faculty','','7','13','','','3','2018-09-08 07:32:58','2018-09-11 07:37:35');
INSERT INTO site_navigation_items VALUES('15','1','School History','','8','13','','','4','2018-09-08 07:33:14','2018-09-11 07:37:42');
INSERT INTO site_navigation_items VALUES('16','1','Notice','','9','0','','','5','2018-09-08 07:33:57','2018-09-12 08:07:16');
INSERT INTO site_navigation_items VALUES('17','1','News','','6','0','','','7','2018-09-08 07:34:05','2018-09-12 08:07:16');
INSERT INTO site_navigation_items VALUES('18','1','Contact','','11','','','','8','2018-09-08 07:34:15','2018-09-12 08:20:06');
INSERT INTO site_navigation_items VALUES('20','2','Home','','5','0','','','1','2018-09-08 16:01:35','2018-09-08 16:10:52');
INSERT INTO site_navigation_items VALUES('22','2','Notice','#','9','0','','','2','2018-09-08 16:10:14','2018-09-12 09:07:31');
INSERT INTO site_navigation_items VALUES('23','2','News','#','6','0','','','4','2018-09-08 16:10:21','2018-09-12 09:07:31');
INSERT INTO site_navigation_items VALUES('24','2','Contact','#','11','0','','','5','2018-09-08 16:10:29','2018-09-12 09:07:31');
INSERT INTO site_navigation_items VALUES('25','1','Login','login_link','','0','','','9','2018-09-09 08:38:05','2018-09-12 08:07:16');
INSERT INTO site_navigation_items VALUES('26','1','Event','','10','0','','','6','2018-09-12 08:07:09','2018-09-12 08:07:16');
INSERT INTO site_navigation_items VALUES('27','2','Event','','10','','','','3','2018-09-12 09:07:25','2018-09-12 09:07:59');



DROP TABLE IF EXISTS site_navigations;

CREATE TABLE `site_navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO site_navigations VALUES('1','main_menu','2018-09-07 16:36:59','2018-09-08 15:10:41');
INSERT INTO site_navigations VALUES('2','footer_menu','2018-09-07 16:37:07','2018-09-08 15:10:34');



DROP TABLE IF EXISTS sms_logs;

CREATE TABLE `sms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receiver` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS staff_attendances;

CREATE TABLE `staff_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO staff_attendances VALUES('1','26','2018-07-31','4','2018-07-31 09:06:07','2018-07-31 09:06:07');
INSERT INTO staff_attendances VALUES('2','25','2018-07-31','4','2018-07-31 09:06:07','2018-07-31 09:06:07');
INSERT INTO staff_attendances VALUES('3','18','2018-07-31','4','2018-07-31 09:06:07','2018-07-31 09:06:07');
INSERT INTO staff_attendances VALUES('4','14','2018-07-31','4','2018-07-31 09:06:07','2018-07-31 09:06:07');
INSERT INTO staff_attendances VALUES('5','26','2018-08-19','1','2018-08-19 07:24:03','2018-08-19 07:24:03');
INSERT INTO staff_attendances VALUES('6','25','2018-08-19','1','2018-08-19 07:24:03','2018-08-19 07:24:03');
INSERT INTO staff_attendances VALUES('7','18','2018-08-19','1','2018-08-19 07:24:03','2018-08-19 07:24:03');
INSERT INTO staff_attendances VALUES('8','14','2018-08-19','1','2018-08-19 07:24:03','2018-08-19 07:24:03');
INSERT INTO staff_attendances VALUES('9','26','2018-08-01','1','2018-08-19 07:33:54','2018-08-19 07:33:54');
INSERT INTO staff_attendances VALUES('10','25','2018-08-01','1','2018-08-19 07:33:54','2018-08-19 07:33:54');
INSERT INTO staff_attendances VALUES('11','18','2018-08-01','1','2018-08-19 07:33:54','2018-08-19 07:33:54');
INSERT INTO staff_attendances VALUES('12','14','2018-08-01','1','2018-08-19 07:33:54','2018-08-19 07:33:54');
INSERT INTO staff_attendances VALUES('13','26','2018-08-02','1','2018-08-19 07:34:07','2018-08-19 07:34:07');
INSERT INTO staff_attendances VALUES('14','25','2018-08-02','1','2018-08-19 07:34:07','2018-08-19 07:34:07');
INSERT INTO staff_attendances VALUES('15','18','2018-08-02','1','2018-08-19 07:34:07','2018-08-19 07:34:07');
INSERT INTO staff_attendances VALUES('16','14','2018-08-02','1','2018-08-19 07:34:07','2018-08-19 07:34:07');
INSERT INTO staff_attendances VALUES('17','26','2018-08-03','4','2018-08-19 07:34:17','2018-08-19 07:34:17');
INSERT INTO staff_attendances VALUES('18','25','2018-08-03','4','2018-08-19 07:34:17','2018-08-19 07:34:17');
INSERT INTO staff_attendances VALUES('19','18','2018-08-03','4','2018-08-19 07:34:17','2018-08-19 07:34:17');
INSERT INTO staff_attendances VALUES('20','14','2018-08-03','4','2018-08-19 07:34:17','2018-08-19 07:34:17');



DROP TABLE IF EXISTS student_attendances;

CREATE TABLE `student_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO student_attendances VALUES('9','2','1','1','2018-06-06','1','2018-06-05 18:50:37','2018-06-06 10:42:05');
INSERT INTO student_attendances VALUES('10','4','1','1','2018-06-06','2','2018-06-05 18:50:37','2018-06-06 10:42:05');
INSERT INTO student_attendances VALUES('11','3','1','1','2018-06-06','1','2018-06-06 06:44:47','2018-06-06 10:42:05');
INSERT INTO student_attendances VALUES('66','2','1','1','2018-06-08','3','2018-06-06 10:56:53','2018-06-06 11:01:33');
INSERT INTO student_attendances VALUES('67','3','1','1','2018-06-08','3','2018-06-06 10:56:53','2018-06-06 11:01:33');
INSERT INTO student_attendances VALUES('68','4','1','1','2018-06-08','3','2018-06-06 10:56:53','2018-06-06 11:01:33');
INSERT INTO student_attendances VALUES('69','2','1','1','2018-07-31','4','2018-07-31 09:03:53','2018-07-31 09:03:53');
INSERT INTO student_attendances VALUES('70','3','1','1','2018-07-31','4','2018-07-31 09:03:53','2018-07-31 09:03:53');
INSERT INTO student_attendances VALUES('71','4','1','1','2018-07-31','4','2018-07-31 09:03:53','2018-07-31 09:03:53');
INSERT INTO student_attendances VALUES('72','2','1','1','2018-07-21','1','2018-08-18 16:14:35','2018-08-18 16:14:35');
INSERT INTO student_attendances VALUES('73','3','1','1','2018-07-21','2','2018-08-18 16:14:35','2018-08-18 16:14:35');
INSERT INTO student_attendances VALUES('74','4','1','1','2018-07-21','1','2018-08-18 16:14:35','2018-08-18 16:14:35');
INSERT INTO student_attendances VALUES('75','2','1','1','2018-07-11','2','2018-08-18 16:14:45','2018-08-18 16:14:45');
INSERT INTO student_attendances VALUES('76','3','1','1','2018-07-11','1','2018-08-18 16:14:45','2018-08-18 16:14:45');
INSERT INTO student_attendances VALUES('77','4','1','1','2018-07-11','1','2018-08-18 16:14:45','2018-08-18 16:14:45');
INSERT INTO student_attendances VALUES('78','2','1','1','2018-07-02','1','2018-08-18 17:04:46','2018-08-18 17:04:46');
INSERT INTO student_attendances VALUES('79','3','1','1','2018-07-02','1','2018-08-18 17:04:46','2018-08-18 17:04:46');
INSERT INTO student_attendances VALUES('80','4','1','1','2018-07-02','1','2018-08-18 17:04:46','2018-08-18 17:04:46');



DROP TABLE IF EXISTS student_groups;

CREATE TABLE `student_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO student_groups VALUES('1','Science','2018-05-31 18:06:39','2018-05-31 18:06:39');
INSERT INTO student_groups VALUES('2','Arts','2018-05-31 18:06:49','2018-05-31 18:06:49');
INSERT INTO student_groups VALUES('3','Commerce','2018-05-31 18:06:58','2018-06-02 07:39:07');



DROP TABLE IF EXISTS student_payments;

CREATE TABLE `student_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO student_payments VALUES('1','1','2018-07-21','100.00','First Payment','2018-07-21 12:16:39','2018-07-21 12:52:16');
INSERT INTO student_payments VALUES('2','1','2018-07-21','50.00','2nd Payment','2018-07-21 12:20:37','2018-07-21 12:20:37');
INSERT INTO student_payments VALUES('3','1','2018-07-21','100.00','Final Payment','2018-07-21 12:53:16','2018-07-21 12:53:16');
INSERT INTO student_payments VALUES('4','3','2018-09-04','150.00','Pay Using Stripe','2018-09-04 07:09:24','2018-09-04 07:09:24');



DROP TABLE IF EXISTS student_sessions;

CREATE TABLE `student_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `optional_subject` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id_2` (`student_id`,`class_id`,`section_id`),
  KEY `student_id` (`student_id`,`class_id`,`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO student_sessions VALUES('1','1','2','1','1','1','','2018-06-03 18:31:44','2018-06-03 18:31:44');
INSERT INTO student_sessions VALUES('2','1','3','1','1','2','','2018-06-03 18:36:16','2018-06-03 19:27:03');
INSERT INTO student_sessions VALUES('3','1','4','1','1','3','4','2018-06-05 07:36:27','2018-07-12 14:39:45');
INSERT INTO student_sessions VALUES('18','13','4','2','3','1','','2018-09-14 09:29:31','2018-09-14 09:29:31');
INSERT INTO student_sessions VALUES('19','13','2','2','3','2','','2018-09-14 09:29:31','2018-09-14 09:29:31');
INSERT INTO student_sessions VALUES('20','13','3','2','4','3','','2018-09-14 09:29:31','2018-09-14 09:29:31');



DROP TABLE IF EXISTS students;

CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_group` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO students VALUES('2','22','1','Jony','D.Costa','2013-06-04','Male','A+','Christian','','','Dhaka','Bangladesh','1001','','','','2018-06-03 18:31:44','2018-06-03 18:31:44');
INSERT INTO students VALUES('3','23','1','Ray','Gomes','2015-06-04','Male','A+','Christian','','','Dhaka','Bangladesh','1002','','','','2018-06-03 18:36:16','2018-06-03 18:54:01');
INSERT INTO students VALUES('4','24','4','Smith','Gomes','2013-06-05','Male','A+','Christian','','','Dhaka','Bangladesh','10022','1','','','2018-06-05 07:36:27','2018-07-13 09:00:39');



DROP TABLE IF EXISTS subjects;

CREATE TABLE `subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `full_mark` int(11) NOT NULL,
  `pass_mark` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO subjects VALUES('1','English','1001','Theory','1','100','40','2018-05-28 07:49:21','2018-07-09 11:39:29');
INSERT INTO subjects VALUES('2','Bangla','1002','Theory','1','100','40','2018-05-28 07:49:33','2018-07-09 11:39:22');
INSERT INTO subjects VALUES('3','Math','1003','Theory','1','100','40','2018-05-29 09:07:30','2018-07-09 11:39:16');
INSERT INTO subjects VALUES('4','ICT','1004','Theory','1','100','40','2018-06-05 10:26:46','2018-07-11 11:36:13');
INSERT INTO subjects VALUES('5','English','1001','Theory','2','100','40','2018-07-09 17:11:46','2018-07-09 17:11:46');



DROP TABLE IF EXISTS syllabus;

CREATE TABLE `syllabus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `class_id` int(11) NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO syllabus VALUES('1','1','Class One Syllabus','<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>','1','1527779602.pdf','2018-05-31 15:13:22','2018-08-31 06:29:17');



DROP TABLE IF EXISTS teachers;

CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `joining_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO teachers VALUES('1','14','Mr Gilbart','English Teacher','1980-05-25','Male','Christian','+880167845545','Dhaka','2016-05-25','2018-05-25 08:21:03','2018-05-25 08:21:03');
INSERT INTO teachers VALUES('2','18','Rashid Sir','Math Teacher','1978-05-29','Male','Christian','+8816356554','Dhaka','2010-05-29','2018-05-29 08:37:20','2018-06-02 08:08:44');
INSERT INTO teachers VALUES('3','25','Khaled Sir','English Teacher','1978-07-13','Male','Christian','+88016795454','Dhaka','2017-07-14','2018-07-12 18:52:38','2018-07-12 18:52:38');
INSERT INTO teachers VALUES('4','26','Robert Sir','Math Teacher','1980-07-13','Male','Christian','+88016796414','Dhaka','2010-07-13','2018-07-12 18:53:27','2018-07-12 18:53:27');



DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` date NOT NULL,
  `account_id` int(11) NOT NULL,
  `trans_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chart_id` int(11) NOT NULL,
  `payee_payer_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','2018-07-13','1','income','1500.00','cr','1','1','1','3','3','','15315048196_Home.png','','2018-07-13 17:29:06','2018-07-13 18:00:19');
INSERT INTO transactions VALUES('2','2018-07-14','1','expense','200.00','dr','1','1','1','3','3','','153150589911_Search.png','','2018-07-13 18:18:04','2018-07-13 18:18:19');
INSERT INTO transactions VALUES('3','2018-08-16','1','income','5000.00','cr','2','1','1','3','','','','','2018-08-19 14:12:01','2018-08-19 14:12:01');
INSERT INTO transactions VALUES('4','2018-08-19','2','income','1000.00','cr','1','2','1','3','','','','','2018-08-19 14:12:15','2018-08-19 14:12:15');



DROP TABLE IF EXISTS transport_members;

CREATE TABLE `transport_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `member_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS transport_vehicles;

CREATE TABLE `transport_vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transport_vehicles VALUES('1','Toyota 1995','5641155','2018-07-06 09:01:10','2018-07-06 09:01:10');



DROP TABLE IF EXISTS transports;

CREATE TABLE `transports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `road_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `road_fare` decimal(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transports VALUES('1','Framgate to Gulshan','1','20.00','','2018-07-06 09:01:34','2018-07-06 09:01:34');



DROP TABLE IF EXISTS user_messages;

CREATE TABLE `user_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `read` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user_messages VALUES('1','1','14','y','2018-08-16 08:54:33','2018-08-31 07:04:44');
INSERT INTO user_messages VALUES('2','1','18','y','2018-08-16 08:54:33','2018-08-31 07:38:58');
INSERT INTO user_messages VALUES('3','1','25','n','2018-08-16 08:54:33','2018-08-16 08:54:33');
INSERT INTO user_messages VALUES('4','2','22','y','2018-08-16 09:14:14','2018-08-30 09:32:03');
INSERT INTO user_messages VALUES('5','3','3','y','2018-08-16 09:32:17','2018-08-29 17:55:05');
INSERT INTO user_messages VALUES('6','4','1','n','2018-08-16 10:23:16','2018-08-16 10:23:16');
INSERT INTO user_messages VALUES('7','8','3','y','2018-08-29 17:23:39','2018-08-29 17:58:41');
INSERT INTO user_messages VALUES('8','9','24','y','2018-08-30 07:05:45','2018-08-30 07:25:01');



DROP TABLE IF EXISTS user_notices;

CREATE TABLE `user_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user_notices VALUES('13','1','Student','2018-09-03 10:54:52','2018-09-03 10:54:52');
INSERT INTO user_notices VALUES('14','1','Parent','2018-09-03 10:54:52','2018-09-03 10:54:52');
INSERT INTO user_notices VALUES('15','1','Teacher','2018-09-03 10:54:52','2018-09-03 10:54:52');
INSERT INTO user_notices VALUES('16','2','Website','2018-09-10 17:17:30','2018-09-10 17:17:30');
INSERT INTO user_notices VALUES('17','3','Website','2018-09-12 07:57:05','2018-09-12 07:57:05');
INSERT INTO user_notices VALUES('18','4','Admin','2018-09-12 16:34:58','2018-09-12 16:34:58');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_plus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','0','ANTHONY PROBAL GOMEZ','anthonyprobalgomez@gmail.com','$2y$10$OA5yzitQwutkT1oq/wEVaubq3Ar55UXDK3WTu1OnRr2d78i5eAZya','Admin','+8801825567058','1','users/15266346192013_Toyota.jpg','','','','','g0KEm1pdc97MfKwvAST7SAtuJoOW7042yW5SivHTbjTFGzccDchDanx7aMxa','','2018-08-16 18:25:30');
INSERT INTO users VALUES('3','0','Kennedy','kennedyrodrick93@gmail.com','$2y$10$CH5zUpFo/dJzWE.bxgP2aOnRbRw3qRMB5LB5B5gaVkpqOJS7GDWBu','Admin','+8801825567058','1','users/profile.png','#','#','#','#','cTiw2NRXToLDrs4KYG28Od2OfPw0T8Ging6EBGOpMds1czEpCIVU5yiuDUmO','2018-05-18 09:10:36','2018-09-11 10:06:35');
INSERT INTO users VALUES('14','0','Mr Gilbart','gilbart@gmail.com','$2y$10$PrVB7UIuvHdT6kYk3Ae9fO1IMUcpOKuKENSGJtAn.MWux6NbATiGi','Teacher','','1','teachers/profile.png','','','','','t5LDEjN1YdWqHopfRX4A9UN5Wr208GO3H57QzPvhhORDfNe3bBD7SJXx3jnz','2018-05-25 08:21:03','2018-05-25 08:21:03');
INSERT INTO users VALUES('15','0','Mr Mathew','mathew@gmail.com','$2y$10$CG/FTdBhsb/DDqhOLfMRGuE5YRkRjpd4p038mgM2eiMnBZzQwE8Ti','Parent','','1','parents/profile.png','','','','','','2018-05-25 08:22:32','2018-05-25 08:22:32');
INSERT INTO users VALUES('18','0','Rashid Sir','rashid@gmail.com','$2y$10$lyPTGa7.Nv/KBfhN1fA.ouVTID3/m2Ns4gyrRJKfj6/Ucjuts0lvm','Teacher','','1','teachers/profile.png','','','','','83dSoUohHCMxx7HRUoVt1cOEbUUoFT29VfVyKerJyUTnOiUkcFkyT78eKQV6','2018-05-29 08:37:20','2018-05-29 08:37:20');
INSERT INTO users VALUES('20','0','Hubart Gomes','hubart@gmail.com','$2y$10$HvEpFuoe1zvCBUvSZIrcPuamXDFkfKdWozZmdrxjU3l4GDvtKM4Eu','Parent','','1','parents/profile.png','','','','','OmWsa9Ph2sb7U7asdrpZ4UCmkrSvmyuRogsbwIVsK2LME3Ub3uCECytb8Awa','2018-06-02 18:23:54','2018-06-02 18:23:54');
INSERT INTO users VALUES('22','0','Jony D.Costa','jony@gmail.com','$2y$10$T5eRnMcVtG5zjYll4GA97Oto1okb4Gxmx.chl7GgD0MNlpPAqUg0e','Student','','1','students/profile.png','','','','','AhWNS5pAhF3WbQCcX0Wi1wz5rO8tWfkhVKt0hJupoj8zsWCkpjF3gEhUBCsa','2018-06-03 18:31:44','2018-06-03 18:31:44');
INSERT INTO users VALUES('23','0','Ray Gomes','ray@gmail.com','$2y$10$UHRBIGyLQgteT2bU6IS0BOHwP/ui5BKdRTBnDkpVJSpEWhIsvGgkq','Student','','1','students/profile.png','','','','','9si7YSV4sf2fImihA8FGX36qWuEZ9V0JjONthJOtOQhcWOZxvakWsn9mAGNM','2018-06-03 18:36:16','2018-06-03 18:55:15');
INSERT INTO users VALUES('24','0','Smith Gomes','smith@gmail.com','$2y$10$mADUN0LcSsllXyHc9vQzlOm.If4yj2Kc0yH6N5rbz/qo5YTbzPTCO','Student','','1','students/1533042749.jpeg','','','','','arYwYqNasSJ6Ai7LpCDV9GR9dWV82TMiOO4R4ovOOZkYckMeMcvGVx3a0YN5','2018-06-05 07:36:27','2018-07-31 13:12:29');
INSERT INTO users VALUES('25','0','Khaled Sir','khaled@gmail.com','$2y$10$ST2sno3rVW3Efhe6rdrGc.T66SQ/NDF1rE6tZeVR3hH0Zy73hgR3q','Teacher','','1','teachers/profile.png','','','','','','2018-07-12 18:52:38','2018-07-12 18:52:38');
INSERT INTO users VALUES('26','0','Robert Sir','robert@gmail.com','$2y$10$gWj9aydXyAHVdm6bTqeuF.0Gch8NTTImjE0RIbCIPePOOA8jPiDEi','Teacher','','1','teachers/profile.png','','','','','7BFnNFdacCmaGpHAi9XMEP3QRmdfGhoL2txAlNQYDfgfFQmTB6nhWDgsFL4N','2018-07-12 18:53:27','2018-07-12 18:53:27');
INSERT INTO users VALUES('27','3','Mr. Bablu','bablu@gmail.com','$2y$10$zoTN5mD9AuWBgCkmBN8Vv.5.zqSdHLDNeJyCybRs1GV0eHfkfPv/q','Librarian','01858646984','1','users/profile.png','','','','','rmJBLqkbhS8pmUxg70f8ByvEXjSYdzF8YiHTz5UoE6fAEZPBb110e4KwKqLX','2018-08-29 10:57:00','2018-08-29 12:07:56');
INSERT INTO users VALUES('28','4','Gaffer','gaffer@gmail.com','$2y$10$eEff3Eqf1oRXTaAriv5eF.aSXZl7AB3ww74tLM8h/D0v4usgPV.se','Accountant','+8801564566565','1','users/profile.png','#','#','#','#','D4BxXLE91eLmLeDNeRSXAFMIB43LSM3r4CkfQbaErM2QLwbDG3E5RzIVgUV2','2018-09-14 08:58:11','2018-09-14 08:58:11');
INSERT INTO users VALUES('29','0','Khaled Khan','khaled2@gmail.com','$2y$10$Dw.DJm2Iuj9Q9QHmuAUnrON23YV8xBeDYUacV.GOE25ErFXimF5iK','Employee','+880167564456','1','users/profile.png','#','#','#','#','6gpa5fDVPsIWtk0QM9ZwYBP4E5KNUm4qPyn8moXIdfx1dJFM2g0CWbUXbSNt','2018-09-14 09:13:00','2018-09-14 09:13:00');



DROP TABLE IF EXISTS website_languages;

CREATE TABLE `website_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO website_languages VALUES('15','Bangla','2018-09-08 18:10:32','2018-09-08 18:10:32');



