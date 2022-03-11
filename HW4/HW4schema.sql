-- DROP TABLE Mentions;
-- DROP TABLE Watched;
-- DROP TABLE Message;
-- DROP TABLE MeetingRecording;
-- DROP TABLE Attended;
-- DROP TABLE Meeting;
-- DROP TABLE Teaches;
-- DROP TABLE EnrolledIn;
-- DROP TABLE Course;
-- DROP TABLE AcademicFields;
-- DROP TABLE Student;
-- DROP TABLE Instructor;
-- DROP TABLE Users;


CREATE TABLE Users(
    user_id INTEGER,
    email VARCHAR(25) UNIQUE NOT NULL,     
    firstname VARCHAR NOT NULL, 
    lastname VARCHAR  NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE Instructor(
    instructor_id INTEGER,
    title VARCHAR NOT NULL, 
    PRIMARY KEY (instructor_id),
    FOREIGN KEY (instructor_id) REFERENCES Users(user_id)
);

CREATE TABLE Student(
    student_id INTEGER,
    PRIMARY KEY (student_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
);


CREATE TABLE AcademicFields(
    instructor_id INTEGER,
    academicfield VARCHAR NOT NULL, 
    PRIMARY KEY (instructor_id,academicfield),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Course(
    course_id VARCHAR,
    title VARCHAR NOT NULL,
    description VARCHAR,            
    PRIMARY KEY (course_id)
);

CREATE TABLE EnrolledIn(
    course_id VARCHAR,
    student_id INTEGER,
    enrollment_date TIMESTAMP NOT NULL,
    PRIMARY KEY (course_id,student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE Teaches(
    course_id VARCHAR,
    instructor_id INTEGER,
    PRIMARY KEY (course_id,instructor_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Meeting(
    meeting_id INTEGER,
    title VARCHAR NOT NULL,
    passcode VARCHAR,           
    meeting_time TIMESTAMP NOT NULL,
    duration INTEGER NOT NULL,
    course_id VARCHAR, 
    instructor_id INTEGER NOT NULL, 
    PRIMARY KEY (meeting_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Attended(
    student_id INTEGER,
    meeting_id INTEGER,
    from_timestamp TIMESTAMP NOT NULL, 
    to_timestamp TIMESTAMP NOT NULL,   
    PRIMARY KEY (student_id,meeting_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE MeetingRecording(
    recording_number INTEGER,
    meeting_id INTEGER, 
    start_time TIMESTAMP NOT NULL, 
    end_time TIMESTAMP NOT NULL, 
    PRIMARY KEY (recording_number,meeting_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id)
);

CREATE TABLE Message(
    message_id INTEGER,
    meeting_id INTEGER,
    message_time TIMESTAMP NOT NULL, 
    message_text VARCHAR NOT NULL, 
    user_id INTEGER NOT NULL,  
    PRIMARY KEY (message_id,meeting_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)   
);

CREATE TABLE Watched(
    recording_number INTEGER,
    meeting_id INTEGER,
    student_id INTEGER, 
    PRIMARY KEY (recording_number,meeting_id,student_id),
    FOREIGN KEY (recording_number,meeting_id) REFERENCES MeetingRecording(recording_number,meeting_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

CREATE TABLE Mentions(
    message_id INTEGER,
    meeting_id INTEGER,
    user_id INTEGER, 
    PRIMARY KEY (message_id,meeting_id,user_id),
    FOREIGN KEY (message_id,meeting_id) REFERENCES Message(message_id,meeting_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
