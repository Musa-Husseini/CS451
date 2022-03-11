-- #1 NEED TO FIX ORDER BY
-- SELECT *
-- FROM MeetingRecording MR, Users U, Meeting M
-- WHERE MR.start_time < '2022-01-17' 
-- ORDER BY U.user_id, U.firstname,  MR.meeting_id, M.title, M.meeting_time, MR.start_time, MR.recording_number

SELECT *
FROM MeetingRecording
WHERE start_time < '2022-01-17' ;

-- #2 Need to figure out how to return names, and title
SELECT COUNT(student_id), course_id
FROM EnrolledIn
GROUP BY course_id
HAVING COUNT(student_id) > 3 


--#3 Need to figure out how to return everything in right order
SELECT DISTINCT E1.user_id, E1.meeting_id
FROM Message E1, Message E2
WHERE E1.meeting_id = E2.meeting_id and E1.message_time = E2.message_time and E1.user_id <> E2.user_id

-- #4 Done

SELECT firstname, lastname
FROM Users U1
INNER JOIN AcademicFields A1 ON A1.instructor_id = U1.user_id and  A1.academicfield = 'Machine Learning' 
INNER JOIN AcademicFields A2 ON A2.instructor_id = U1.user_id and  A2.academicfield = 'Artificial Intelligence' 
GROUP BY U1.firstname, U1.lastname


-- #5a Done
SELECT *
FROM Meeting
WHERE duration > (
    SELECT AVG(duration)
    FROM Meeting
)
ORDER BY meeting_id
-- #5b Done

SELECT meeting_id, title, passcode, meeting_time, duration, course_id, instructor_id
FROM Meeting NATURAL LEFT JOIN (
	SELECT AVG(duration) as classAvg, course_id
	FROM Meeting
	GROUP BY course_id

) A
WHERE duration > classAvg

-- #6 10/11 correct rows have an extra for some reason
SELECT DISTINCT course_id, student_id
FROM EnrolledIn E1 NATURAL JOIN Meeting M1 NATURAL LEFT JOIN Attended A1
WHERE from_timestamp IS NULL
ORDER BY student_id, course_id



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
) B


-- #8



-- #9 Need to order correctly
SELECT icounter, scounter, icount.meeting_id, scount.meeting_id
FROM
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
WHERE icount.meeting_id = scount.meeting_id and icounter > scounter
 


-- #10