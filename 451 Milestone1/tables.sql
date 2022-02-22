CREATE TABLE User(
  user_id integer PRIMARY KEY,
  average_stars varchar,
  cool varchar,
  fans varchar,
  tipcount integer,
  useful varchar,
  friends varchar,
  name varchar,
  yelping_since varchar
  );
  
  
CREATE TABLE Business(
  business_id integer PRIMARY KEY,
  hours_sunday varchar,
  hours_monday varchar,
  hours_tuesday varchar,
  hours_wednesday varchar,
  hours_thursday varchar,
  hours_friday varchar,
  hours_saturday varchar,
  address_street varchar,
  address_city varchar,
  address_state varchar,
  address_postal varchar,
  address_longitude varchar,
  address_latitude varchar,
  business_name varchar,
  is_open varchar,
  review_count varchar,
  review_stars varchar,
  ); 
 
CREATE TABLE Review(
  review_id integer,
  user_id integer NOT NULL,
  business_id integer NOT NULL,
  stars varchar,
  review_date DATE,
  funny varchar,
  review_text varchar,
  cool varchar,
  useful varchar,
  PRIMARY KEY (review_id),
  FOREIGN KEY(user_id) REFERENCES Users(user_id),
  FOREIGN KEY(business_id) REFERENCES Business(business_id)
  );
  
CREATE TABLE Tip(
  likes integer,
  user_id integer NOT NULL,
  business_id integer NOT NULL,
  tip_text varchar,
  PRIMARY KEY (user_id, business_id),
  FOREIGN KEY(user_id) REFERENCES Users(user_id),
  FOREIGN KEY(business_id) REFERENCES Business(business_id)
);


CREATE TABLE CheckIn(
  checkin_date Date,
  business_id integer,
  PRIMARY KEY(business_id),
  FOREIGN KEY(business_id) REFERENCES Business(business_id)
  );

CREATE TABLE Business_Categories (
  business_id INTEGER NOT NULL,
  category VARCHAR,
  PRIMARY KEY (business_id),
  FOREIGN KEY (business_id) REFERENCES Business (business_id)
);

CREATE TABLE Business_Attributes (
  business_id INTEGER NOT NULL,
  business_attribute VARCHAR,
  PRIMARY KEY (business_id),
  FOREIGN KEY (business_id) REFERENCES Business (business_id)
);