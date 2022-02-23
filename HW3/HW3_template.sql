
Name :   Musa Husseini
WSU ID: 11658865

-- Q1
-- 1. Find the meetings which are hosted by the instructor of `CptS 321’ (i.e., hosted by the instructor who teaches ‘CptS 321’). Return the meeting title and the course_id for the meeting, and instructor’s first and last names.  Order the results by meeting course_id and meeting title.  
τ course_id, title (π title, course_id, firstName, lastName (Meeting  ⨝ (σ course_id='CptS321' Meeting) ⨝ (σ firstName='Venera' User) ⨝ (σ lastName='Arnaoudova' User)))
-- Q2
--2. Find the student users who did not post any messages. Return the student_id, email, firstname and lastname of those students. 
π student_id, email, firstName, lastName (σ message_text=null (σ student_id=user_id (Student ⨝ User) ⟕ Message))
 -- Q3
 --3. Find the instructors who work in the “Machine Learning” field but are not teaching any courses. Return the instructor_id, first name, and lastname of those. 
 -- σ course_id=instructor_id (σ title='Introduction to Machine Learning' Course) 
-- π instructor_id, firstName, lastName, email (Instructor ⨝ User)
π instructor_id, firstName, lastName, email (σ title='Introduction to Machine Learning' Course ⨝ (Instructor ⨝ User) )

-- Q4
-- 4.	Find the pair of messages that are posted at the same meeting and at the same time but by different users. Return the common meeting_id and message_time of the two messages as well as the message_text and user_id of each message.

 
--Q5
--5. Find the users who are mentioned 2 or more times in the messages of CptS451 meetings. (‘CptS451’ is the id of the course associated with the meetings; assume we consider all meetings of ‘CptS451’.) Return the user_id, email, first and lastname of the user mentioned and the number of times they are mentioned. 
 

--Q6
-- 6. Find the instructors who hosted more than 3 meetings that are associated with the same course. Return the course_id, number of meetings, and the first and last name of the instructor.  


 --Q7
-- 7. Find the ‘CptS451’ students who didn’t attend a meeting of the ‘CptS451’ course, but they watched that meeting’s recording. Return the student_id, meeting’s title, and recording_number of the recording student watched. 


--Q8
-- 8. Find the meetings for which the number of messages posted by instructors is greater than the number of messages posted by students.  Return the meeting_id, number of messages by instructors, and the number of messages by students for those meetings. 

 
--Q9
-- 9. Find the longest meeting(s) (i.e., the meetings with max duration). Return the meeting_id, title and duration of those meeting(s). 
R1 = γ MAX(duration)→numMeetings  (Meeting)
π meeting_id, title, duration (σ duration = numMeetings (Meeting ⨝ R1))
 
--Q10
-- 10. Find the meeting(s) with the most number of attendees. Return the meeting title and the number of attendees for those meeting(s). 








--Q6




-- Q7


 
-- Q8



-- Q9



-- Q10
