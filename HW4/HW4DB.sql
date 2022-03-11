INSERT INTO Users  (user_id, email, firstname, lastname) VALUES 
	(1 , 'arslanay@wsu.edu', 'Sakire', 'ArslanAy'), 
	(2 , 'cook@wsu.edu', 'Diane', 'Cook'),    
	(3 , 'hauser@wsu.edu', 'Carl', 'Hauser'),   
	(4 , 'zeng@wsu.edu', 'Bolong', 'Zeng'), 
	(5 , 'tyler@wsu.edu', 'Tyler', 'Walker'),  
	(6 , 'ofallon@wsu.edu', 'Andy', 'OFallon'),  
	(7 , 'wang@wsu.edu','KC', 'Wang'), 
	(8 , 'lucas@wsu.edu', 'Lucas', 'Mason'),    
	(9 , 'noel@wsu.edu', 'Noel', 'Sam'),   
   (10, 'andy@wsu.edu', 'Andy', 'White'),  
   (11, 'arnaoudova@wsu.edu', 'Venera' , 'Arnaoudova'),    
   (12, 'rea@wsu.edu', 'Rae', 'Marks'),    	
   (13, 'rachel@wsu.edu', 'Rachel', 'Forbes'),  
   (14, 'jacob@wsu.edu', 'Jacob', 'Lee'),    
   (15, 'travis@wsu.edu', 'Travis', 'Person'),    
   (16, 'min@wsu.edu', 'Min', 'Quin'),    
   (17, 'kelly@wsu.edu', 'Kelly', 'Easton'),   
   (18, 'amy@wsu.edu', 'Amy', 'Fan'),    	
   (19, 'ben@wsu.edu', 'Ben', 'Hill'),    
   (20, 'connor@wsu.edu', 'Connor', 'Hall');    		


INSERT INTO Instructor  (instructor_id, title) VALUES 
   (1 , 'Associate Professor'),    
  (11 , 'Associate Professor'), 
   (2 , 'Regents Professor'),    
   (3 , 'Professor'),    
   (4 , 'Assistant Professor'), 
   (6 , 'Professor'),    
   (7 , 'Professor'); 


INSERT INTO Student  (student_id) VALUES 
   (5),
   (8),
   (9),
   (10),
   (12),
   (13),
   (14),
   (15),
   (16),
   (17),
   (18),
   (19),
   (20);

INSERT INTO AcademicFields  (instructor_id,academicfield) VALUES 
   (11  , 'Software Engineering'),
   (11  , 'Software Testing'),	
    (2 , 'Artificial Intelligence'),   
    (2 , 'Machine Learning'),   	
    (2 , 'Data Mining'),   	  
    (3 , 'Machine Learning'),   
    (3 , 'Data Mining'),
    (3 , 'Artificial Intelligence'),	
    (4 , 'Assistant Professor');


INSERT INTO Course (course_id, title, description) VALUES
   ('CptS321'  , 'Object-Oriented Software Principles' , 'Undergraduate'),
   ('CptS322'  , 'Software Engineering Principles I '  , 'Undergraduate'),
   ('CptS451'  , 'Introduction To Data Management' , 'Undergraduate'),
   ('CptS355'  , 'Programming Language Design' , 'Undergraduate'),
   ('CptS437'  , 'Introduction to Machine Learning'    , 'Undergraduate'),
   ('CptS215'  , 'Data Analytics Systems and Algorithms' , 'Undergraduate'), 
   ('STAT412'  , 'Statistical Methods in Research I'   , 'Undergraduate'), 
   ('CptS360'  , 'Systems Programming'   , 'Undergraduate'),   
   ('CptS460'  , 'Operating Systems' , 'Undergraduate'),    
   ('CptS581'  , 'Software Maintenance'  , 'Graduate'),   
   ('CptS415'  , 'Big Data'    , 'Undergraduate'), 
   ('CptS315'  , 'Data Mining'    , 'Undergraduate'), 
   ('CptS440'  , 'Introduction to Artificial Intelligence'    , 'Undergraduate'), 
   ('CptS582'  , 'Software Testing'  , 'Graduate'); 


INSERT INTO EnrolledIn (course_id, student_id, enrollment_date) VALUES
   ('CptS451', 5 ,  '2021-11-14'),
   ('CptS451', 8 ,  '2021-12-03'),
   ('CptS451', 12 , '2021-12-01'),
   ('CptS451', 13 , '2021-12-11'),
   ('CptS321', 5 ,  '2021-11-14'),
   ('CptS321', 12 , '2021-12-01'),
   ('CptS321', 13 , '2021-12-11'),
   ('CptS321', 15 , '2021-12-18'),
   ('CptS355', 5 ,  '2021-11-14'),
   ('CptS355', 9 ,  '2021-12-03'),
   ('CptS355', 13 , '2021-12-10'),
   ('CptS437', 5 ,  '2021-11-14'),
   ('CptS437', 8 ,  '2021-12-03'),
   ('CptS437', 9 ,  '2021-11-14'),
   ('CptS437', 12 , '2021-12-01'),
   ('CptS581', 5 ,  '2021-11-14'),
   ('CptS581', 9 ,  '2021-11-14'),
   ('CptS581', 10 , '2021-12-10'),
   ('CptS581', 12 , '2021-12-01'),
   ('CptS581', 13 , '2021-12-11');


INSERT INTO  Teaches(course_id, instructor_id)  VALUES
   ('CptS451',   1),
   ('CptS355',   1),
   ('CptS322',   1),
   ('CptS437',   2),
   ('CptS440',   2),   
   ('CptS315',   2),   
   ('CptS322',   4),
   ('CptS360',   7),
   ('CptS460',   7),	
   ('CptS321',   11),
   ('CptS581',   11),
   ('CptS215',    3),
   ('CptS415',    3),
   ('CptS440',    3);


INSERT INTO Meeting	(meeting_id, title, passcode, meeting_time,  duration, course_id, instructor_id) VALUES
   (1    , 'Lecture 451 - 1' ,'1111'   , '2022-01-13 01:10 PM' ,   51   , 'CptS451'    , 1),
   (2    , 'Lecture 451 - 2'  ,'2222'   , '2022-01-15 01:10 PM' ,  49   , 'CptS451'    , 1),
   (3    , 'Lecture 451 - 3'  ,'3333'   , '2022-01-17 01:10 PM' ,  49   , 'CptS451'    , 1),
   (4    , 'Lecture 451 - 4'  ,'1234'   , '2022-01-20 01:10 PM' ,  55   , 'CptS451'    , 1),
   (5    , 'Lecture 451 - 5'  ,'2345'   , '2022-01-13 01:10 PM' ,  50   , 'CptS451'    , 11),
   (6    , 'Lecture 321 - 1'  ,'3456'   , '2022-01-20 09:10 AM' ,  50   , 'CptS321'    , 11),
   (7    , 'Lecture 321 - 2'  ,'4444'   , '2022-01-20 09:10 AM' ,  50   , 'CptS321'    , 11),
   (8    , 'Lecture 321 - 3'  ,'5555'   , '2022-01-20 09:10 AM' ,  50   , 'CptS321'    , 11),
   (9    , 'Lecture 321 - 4'  ,'6666'   , '2022-01-20 09:10 AM' ,  51   , 'CptS321'    , 11),
   (10   , 'Lecture 321 - 5'  ,'6667'   , '2022-01-20 09:10 AM' ,  50   , 'CptS321'    , 1),
   (11   , 'Lecture 437 - 1'  ,'7777'   , '2022-01-13 10:10 AM' ,  75   , 'CptS437'    , 11),
   (12   , 'Lecture 437 - 2'  ,'8888'   , '2022-01-15 10:10 AM' ,  75   , 'CptS437'    , 2),
   (13   , 'Lecture 437 - 3'  ,'9999'   , '2022-01-17 10:10 AM' ,  73   , 'CptS437'    , 2),
   (14   , 'Lecture 437 - 4'  ,'5678'   , '2022-01-20 10:10 AM' ,  72   , 'CptS437'    , 2),
   (15   , 'Lecture 355 - 1'  ,'1111'   , '2022-01-20 11:10 AM' ,  50   , 'CptS355'    , 1),
   (16   , 'Lecture 355 - 2'  ,'2222'   , '2022-01-20 11:10 AM' ,  50   , 'CptS355'    , 1),
   (17   , 'Lecture 355 - 3'  ,'3333'   , '2022-01-20 11:10 AM' ,  52   , 'CptS355'    , 1),
   (18   , 'Lecture 355 - 4'  ,'1234'   , '2022-01-20 11:10 AM' ,  50   , 'CptS355'    , 6),
   (19   , 'Planning meeting','1234' , '2022-01-20 03:10 PM' ,  80   , NULL   , 1),   
   (20   , 'Curriculum  meeting', '1234', '2022-01-20 12:00 PM' ,  115  , NULL   , 1),
   (21   , 'Curriculum  meeting', '1234', '2022-01-20 04:10 PM' ,  80   , NULL   , 11	),
   (22   , 'Research meeting', '1234', '2022-01-20 03:00 PM' ,  40   , NULL   , 2);


INSERT INTO Attended(student_id, meeting_id, from_timestamp, to_timestamp) VALUES
   (5 , 1, '2022-01-13 01:10pm',  '2022-01-13 01:55pm'),
   (5 , 2, '2022-01-15 01:10pm',  '2022-01-15 01:55pm'),
   (5 , 3, '2022-01-17 01:10pm',  '2022-01-17 01:55pm'),
   (5 , 4, '2022-01-20 01:10pm',  '2022-01-20 01:59pm'),
   (5 , 5, '2022-01-13 01:10pm',  '2022-01-22 01:55pm'),
   (8 , 1, '2022-01-13 01:10pm',  '2022-01-13 01:59pm'),
   (8 , 2, '2022-01-15 01:10pm',  '2022-01-15 01:35pm'),
   (8 , 3, '2022-01-17 01:10pm',  '2022-01-17 01:55pm'),
   (8 , 4, '2022-01-20 01:10pm',  '2022-01-20 01:59pm'),
   (8 , 5, '2022-01-13 01:10pm',  '2022-01-22 01:55pm'),
   (13 , 5, '2022-01-13 01:10pm',  '2022-01-13 01:55pm'),
   (15 , 1, '2022-01-13 01:10pm',  '2022-01-13 01:45pm'),
   (15 , 2, '2022-01-15 01:10pm',  '2022-01-15 01:49pm'),
   (15 , 3, '2022-01-17 01:10pm',  '2022-01-17 01:55pm'),
   (5 , 11, '2022-01-13 10:10am',  '2022-01-13 10:45am'),
   (5 , 12, '2022-01-15 10:10am',  '2022-01-15 10:45am'),
   (5 , 13, '2022-01-17 10:10am',  '2022-01-17 10:45am'),
   (5 , 14, '2022-01-20 10:10am',  '2022-01-20 10:35am'),
   (8 , 11, '2022-01-13 10:10am',  '2022-01-13 10:45am'),
   (8 , 12, '2022-01-15 10:10am',  '2022-01-15 10:55am'),
   (8 , 13, '2022-01-17 10:10am',  '2022-01-17 10:45am'),
   (8 , 14, '2022-01-20 10:10am',  '2022-01-20 10:55am');


INSERT INTO MeetingRecording ( recording_number, meeting_id,  start_time, end_time) VALUES
   (1 , 1, '2022-01-13 01:10pm',  '2022-01-13 01:55pm'),
   (1 , 2, '2022-01-15 01:10pm',  '2022-01-15 01:55pm'),
   (1 , 3, '2022-01-17 01:10pm',  '2022-01-17 01:55pm'),
   (1 , 4, '2022-01-20 01:10pm',  '2022-01-20 01:29pm'),
   (2 , 4, '2022-01-20 01:35pm',  '2022-01-20 01:59pm'),
   (1 , 5, '2022-01-13 01:10pm',  '2022-01-13 01:20pm'),
   (2 , 5, '2022-01-13 01:25pm',  '2022-01-13 01:35pm'),
   (3 , 5, '2022-01-13 01:38pm',  '2022-01-13 01:55pm'),
   (1 , 11, '2022-01-13 10:10am',  '2022-01-13 10:45am'),
   (1 , 12, '2022-01-15 10:10am',  '2022-01-15 10:45am'),   
   (1 , 13, '2022-01-17 10:10am',  '2022-01-17 10:40am'),
   (2 , 13, '2022-01-17 10:42am',  '2022-01-17 10:45am'),  
   (1 , 14, '2022-01-20 10:10am',  '2022-01-20 10:15am'),
   (2 , 14, '2022-01-20 10:16am',  '2022-01-20 10:20am'),    
   (3 , 14, '2022-01-20 10:20am',  '2022-01-20 10:35am');


INSERT INTO  Message (message_id, meeting_id, message_time, message_text, user_id) VALUES
   (1  , 1, '2022-01-13 01:13pm',   'Welcome to CptS451!', 1), 
   (2  , 1, '2022-01-13 01:25pm',   'HW1 is posted!', 1),
   (3  , 1, '2022-01-13 01:27pm',   'Clarification on problem-2', 5),
   (4  , 1, '2022-01-13 01:29pm',   'What is the difference between BCNF and 3NF?', 5),   
   (5  , 1, '2022-01-13 01:35pm',   'Should we normalize our project DB?', 5),   
   (6  , 1, '2022-01-13 01:27pm',   'Problem-3 clarification', 14),
   (7  , 1, '2022-01-13 01:30pm',   'Strong vs. weak entity', 8),
   (8  , 1, '2022-01-13 01:30pm',   'Do all strong entities have a primary key!', 9),
   (1  , 4, '2022-01-20 01:20pm',   'Notation for partial key.', 13),
   (2  , 4, '2022-01-20 01:21pm',   'Yes, should underline partial keys', 1),
   (3  , 4, '2022-01-20 01:25pm',   'HW3 is posted!', 1),
   (4  , 4, '2022-01-20 01:30pm',   'HW2 is due today!', 1),
   (5  , 4, '2022-01-20 01:40pm',   'All HWs should be submitted on time!', 1),
   (6  , 4, '2022-01-20 01:40pm',   'Is it possible to submit HW1 a little bit late?', 10),
   (1  , 5, '2022-01-22 01:15pm',   'Should we include the query output in our solution?' , 12),
   (2  , 5, '2022-01-22 01:10pm',   'Do you have any questions?', 1),
   (3  , 5, '2022-01-22 01:10pm',   'HW3 is due today!',	1),
   (1  , 12,    '2022-01-15 10:10am',   'HW4 is posted!', 2),
   (2  , 12,    '2022-01-15 10:20am',   'Can we handwrite the solution?', 12),
   (3  , 12,    '2022-01-15 10:21am',   'Do we need to write tests?', 12),
   (4  , 12,    '2022-01-15 10:22am',   'Can we work in pairs?', 12),
   (5  , 12,    '2022-01-15 10:23am',   'Is ML hard?', 13),
   (1  , 13,    '2022-01-17 10:10am',   'HW6 is due today!',	1);


INSERT INTO  Watched (recording_number, meeting_id,  student_id) VALUES
   (1 , 1, 5),
   (1 , 1, 8),
   (1 , 1, 9),
   (1 , 1, 10),
   (1 , 1, 12),
   (1 , 1, 13),
   (1 , 1, 17),
   (1 , 1, 18),
   (1 , 2, 13),
   (1 , 2, 14),
   (1 , 2, 16),
   (1 , 4, 15),
   (2 , 4, 15);


INSERT INTO Mentions (message_id, meeting_id,  user_id) VALUES
   (3 , 1 , 1),  
   (4 , 1 , 1), 
   (5 , 1 , 1), 
   (6 , 1 , 1),
   (1 , 4 , 9), 
   (1 , 4 , 10),
   (1 , 4 , 11),   
   (2 , 4 , 9),  
   (2 , 4 , 10),  
   (5 , 4 , 9), 
   (6 , 4 , 14),
   (1 , 5 , 1),
   (2 , 5 , 5),
   (3 , 5 , 1),
   (2 , 12, 2), 
   (3 , 12, 2);
