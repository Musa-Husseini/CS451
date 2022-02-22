CREATE TABLE Users(
    user_id integer,
    firstname varchar,
    lastname varchar,
    email varchar,
    user_password varchar,
    pronouns varchar,
    PRIMARY KEY(user_id, email)
);

CREATE TABLE Student(
    user_id integer NOT NULL,
    PRIMARY KEY(user_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

CREATE TABLE Instructor(
    user_id integer NOT NULL,
    title varchar,
    PRIMARY KEY(user_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)

);

CREATE TABLE Academic_Fields(
    user_id integer NOT NULL,
    academic_fields varchar,
    PRIMARY(user_id),
    FOREIGN KEY user_id REFERENCES Users(user_id)

);
CREATE TABLE Course(
    course_id integer,
    title varchar,
    course_description varchar,
    PRIMARY KEY(course_id)
);
CREATE TABLE Teaches(
    course_id integer,
    user_id integer,
    PRIMARY KEY(course_id, user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES Instructor(user_id)

);
CREATE TABLE EnrolledIn(
    course_id integer,
    user_id integer,
    enrollment_date DATE,
    PRIMARY KEY(course_id, user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES Instructor(user_id)

);
CREATE TABLE Meeting(
    meeting_id integer,
    course_id integer,
    user_id integer --Hosted relationship from meeting
    title varchar,
    passcode varchar,
    duration TIME,
    start_time TIME,
    PRIMARY KEY(meeting_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES Instructor(user_id)

);
CREATE TABLE Attended(
    user_id integer,
    meeting_id integer,
    attended_from varchar,
    attended_to varchar,
    PRIMARY KEY(user_id, meeting_id),
    FOREIGN KEY(user_id) REFERENCES Student(user_id),
    FOREIGN KEY(meeting_id) REFERENCES Meeting(meeting_id)

);


CREATE TABLE MeetingRecording(
    recording_number integer,
    meeting_id integer,
    meeting_start TIME,
    meeting_end TIME,
    PRIMARY KEY(recording_number, meeting_id),
    FOREIGN KEY(meeting_id) REFERENCES Meeting(meeting_id)
);

CREATE TABLE Tags(
    recording_number integer NOT NULL,
    tags varchar
    PRIMARY KEY(recording_number),
    FOREIGN KEY (recording_number)  REFERENCES MeetingRecording(recording_number)

);

CREATE TABLE Watched(
    user_id integer,
    recording_number integer,
    meeting_id integer,
    PRIMARY KEY(user_id, recording_number, meeting_id),
    FOREIGN KEY(recording_number, meeting_id) REFERENCES MeetingRecording(recording_number, meeting_id),
    FOREIGN KEY(user_id) REFERENCES Student(user_id)

);

CREATE TABLE MeetingMessage(
    message_id integer,
    meeting_id integer,
    user_id integer,
    message_time TIME,
    message_text varchar,
    PRIMARY KEY(message_id, meeting_end),
    FOREIGN KEY(meeting_id) REFERENCES  Meeting(meeting_id)
    FOREIGN KEY (user_id) REFERENCES Course(user_id)

);

CREATE TABLE Mentions(
    user_id integer,
    message_id integer,
    meeting_id integer,
    PRIMARY KEY(user_id, message_id, meeting_id),
    FOREIGN KEY(message_id, meeting_id) REFERENCES MeetingMessage(message_id, meeting_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);
