
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
R1 = User ⨝ σ(course_id=null) (Instructor ⟕ Teaches)
R2 = (σ instructor_id=user_id R1) 
R3 = ((σ academicfield='Machine Learning' AcademicFields)) ⨝ R2
π instructor_id, firstName, lastName, email (R3)

-- Q4
-- 4.	Find the pair of messages that are posted at the same meeting and at the same time but by different users. Return the common meeting_id and message_time of the two messages as well as the message_text and user_id of each message.
R1 = Message ⨝ ((user_id < M2.user_id) ∧ (message_time = M2.message_time) ) (ρ M2 (Message))
π Message.meeting_id, Message.message_time,  Message.message_text, M2.message_text,  Message.user_id, M2.user_id (R1)
 
--Q5
--5. Find the users who are mentioned 2 or more times in the messages of CptS451 meetings. (‘CptS451’ is the id of the course associated with the meetings; assume we consider all meetings of ‘CptS451’.) Return the user_id, email, first and lastname of the user mentioned and the number of times they are mentioned. 
 R1 = (σ course_id='CptS451' Meeting) ⨝ Mentions 
R2 =  (σ(messageCount ≥ 2) (γ user_id; COUNT(message_id)→messageCount (R1)))
π user_id, messageCount, email, firstName, lastName (R2 ⨝ (Mentions ⨝ User))

--Q6
-- 6. Find the instructors who hosted more than 3 meetings that are associated with the same course. Return the course_id, number of meetings, and the first and last name of the instructor.  
R1 = σ(num_meeting ≥ 4) (γ course_id, instructor_id; COUNT(course_id)→ num_meeting (Meeting ⨝ Teaches))
R2 = R1 ⨝ User
R3 = (σ user_id = instructor_id R2)
R4 = π course_id, num_meeting, firstName, lastName (R3)
R4

 --Q7
-- 7. Find the ‘CptS451’ students who didn’t attend a meeting of the ‘CptS451’ course, but they watched that meeting’s recording. Return the student_id, meeting’s title, and recording_number of the recording student watched. 
R1 = ((Watched ⨝ Student) ⨝ Meeting) ⟕ (σ course_id='CptS451' Meeting ⨝ Attended)
R2 = (σ from_timestamp = null R1)
π student_id, title, recording_number (R2)

--Q8
-- 8. Find the meetings for which the number of messages posted by instructors is greater than the number of messages posted by students.  Return the meeting_id, number of messages by instructors, and the number of messages by students for those meetings. 
R1 = (γ meeting_id, user_id; COUNT(meeting_id)→ messageCount Message) ⨝ (σ user_id = instructor_id (User ⨝ Instructor))
R2 = (γ meeting_id, user_id; COUNT(meeting_id)→ messageCount Message) ⨝ (σ user_id = student_id (User ⨝ Student))
R3 = γmeeting_id, user_id;COUNT(meeting_id)→numText Message
R4 = γ meeting_id; SUM(numText)→ iNum (R1 ⨝ R3)
R5 = γ meeting_id; SUM(numText)→ sNum (R2 ⨝ R3)
R6 = ρ instructor R4 ⨝ student.meeting_id=instructor.meeting_id ∧ instructor.iNum > student.sNum ρ student R5
π student.meeting_id, instructor.iNum, student.sNum (R6)
 
--Q9
-- 9. Find the longest meeting(s) (i.e., the meetings with max duration). Return the meeting_id, title and duration of those meeting(s). 
R1 = γ MAX(duration)→numMeetings  (Meeting)
π meeting_id, title, duration (σ duration = numMeetings (Meeting ⨝ R1))
 
--Q10
-- 10. Find the meeting(s) with the most number of attendees. Return the meeting title and the number of attendees for those meeting(s). 
R1 = Meeting ⨝ Attended
R2 =  γ meeting_id; COUNT(student_id)→attended R1
R3 = γ  meeting_id; MAX(attended)→max_attended1 R2
R4 = π title, max_attended1 (Meeting ⨝ R3)
R5 = γ title; MAX(max_attended1)→max_attended R4
π line2.title, line2.max_attended ((ρ line1 R5)  ⨝ line1.max_attended < line2.max_attended  (ρ line2 R5))

