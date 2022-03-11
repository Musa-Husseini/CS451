-- #1 Done
SELECT Users.user_id, Users.firstname, MeetingRecording.meeting_id, Meeting.title, MeetingRecording.start_time, MeetingRecording.recording_number
FROM MeetingRecording, Users, Meeting
WHERE start_time < '2022-01-17' and Meeting.meeting_id = MeetingRecording.meeting_id and Meeting.instructor_id = Users.user_id
ORDER BY Users.user_id, MeetingRecording.meeting_id, MeetingRecording.recording_number;

-- #2 Need to figure out how to return names, and title
SELECT COUNT(student_id), course_id
FROM EnrolledIn
GROUP BY course_id
HAVING COUNT(student_id) > 3 ;


--#3 Double outputs
SELECT DISTINCT E1.meeting_id, e1.message_time, e1.message_text, E1.user_id, E2.user_id
FROM Message E1, Message E2
WHERE E1.meeting_id = E2.meeting_id and E1.message_time = E2.message_time and E1.user_id <> E2.user_id;

-- #4 Done

SELECT firstname, lastname
FROM Users U1
INNER JOIN AcademicFields A1 ON A1.instructor_id = U1.user_id and  A1.academicfield = 'Machine Learning' 
INNER JOIN AcademicFields A2 ON A2.instructor_id = U1.user_id and  A2.academicfield = 'Artificial Intelligence' 
GROUP BY U1.firstname, U1.lastname;


-- #5a Done
SELECT *
FROM Meeting
WHERE duration > (
    SELECT AVG(duration)
    FROM Meeting
)
ORDER BY meeting_id;
-- #5b Done

SELECT meeting_id, title, passcode, meeting_time, duration, course_id, instructor_id
FROM Meeting NATURAL LEFT JOIN (
	SELECT AVG(duration) as classAvg, course_id
	FROM Meeting
	GROUP BY course_id

) A
WHERE duration > classAvg;

-- #6 10/11 correct rows have an extra for some reason
SELECT DISTINCT course_id, student_id
FROM EnrolledIn E1 NATURAL JOIN Meeting M1 NATURAL LEFT JOIN Attended A1
WHERE from_timestamp IS NULL
ORDER BY student_id, course_id;



-- #7 Done 

SELECT student_id, meeting_id, title, recording_number
FROM (
    SELECT *
    FROM EnrolledIn E1 NATURAL JOIN Meeting M1 NATURAL JOIN MeetingRecording MR1 NATURAL JOIN Watched W1
    WHERE course_id = 'CptS451' 
) A NATURAL JOIN (
	SELECT *
	FROM EnrolledIn E1 NATURAL JOIN Meeting M1 NATURAL LEFT JOIN Attended A1
	WHERE course_id = 'CptS451' and from_timestamp IS NULL
) B;


-- #8 Done
SELECT *
FROM
(
	select MAX(message_time) as maxi
	from Message

) as maxMessage,
(
	select Message.message_time, Users.user_id, Users.firstname, Users.lastname, Message.message_text, Meeting.meeting_id
	from Message, Meeting, Users, Student
	where Message.meeting_id = Meeting.meeting_id and Message.user_id = Student.student_id and Users.user_id = Student.student_id

) as x

WHERE maxMessage.maxi = x.message_time;


-- #9 Done
SELECT DISTINCT icount.meeting_id, Meeting.title, icounter, scounter
FROM Message, Meeting,
(
	SELECT COUNT(message_id) as icounter, meeting_id
	FROM (
		SELECT *
		FROM Message, Instructor 
		WHERE Message.user_id = Instructor.instructor_id 
	) A 
	GROUP BY meeting_id
) as icount,

(
	SELECT COUNT(message_id) as scounter, meeting_id
	FROM (
		SELECT *
		FROM Message, Student 
		WHERE Message.user_id = Student.student_id 
	) B
	GROUP BY meeting_id
) as scount
WHERE icount.meeting_id = scount.meeting_id and icounter > scounter and icount.meeting_id = Message.meeting_id and scount.meeting_id = Meeting.meeting_id
ORDER BY icount.meeting_id;
 

-- #10 Done
SELECT DISTINCT a.meeting_id, a.title, user_count, record_count, total_time
FROM Student,
(
	SELECT meeting_id, title
	from Meeting
) a,

(
	SELECT COUNT(student_id) user_count, meeting_id
	FROM Attended 
	GROUP BY meeting_id
) b,

(
	SELECT meeting_id, count(recording_number) as record_count, SUM(EXTRACT (EPOCH FROM (end_time - start_time))) as total_time 
	FROM MeetingRecording
    GROUP BY meeting_id
) c
WHERE b.meeting_id = c.meeting_id and b.meeting_id = a.meeting_id 
ORDER BY a.meeting_id;
