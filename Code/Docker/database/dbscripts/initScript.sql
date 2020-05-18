CREATE TYPE exercise_type AS ENUM (
  'warm_up',
  'strength',
  'cardio'
);

CREATE TABLE Workout (
   id  SERIAL PRIMARY KEY,
   name  varchar,
   creation_date  timestamp,
   creator_id  int,
   official_flag  boolean
);

CREATE TABLE Exercise (
   id  SERIAL PRIMARY KEY,
   name  varchar,
   creator_id  int,
   creation_date  timestamp,
   exercise_type  varchar,
   standard_set_nr  int,
   official_flag  boolean
);

CREATE TABLE Person (
   id  SERIAL PRIMARY KEY,
   name  varchar,
   customer_id  int,
   trainer_id  int,
   is_trainer  boolean
);

CREATE TABLE Customer (
   id  SERIAL PRIMARY KEY,
   join_date  date,
   trainer_id  int,
   cash_customer  boolean,
   member_till  date,
   picture_id  int
);

CREATE TABLE Workout2Exercise (
   workout_id  int,
   exercise_id  int
);

CREATE TABLE Trainer (
   id  SERIAL PRIMARY KEY,
   trainer_since  date,
   picture_id  int
);

CREATE TABLE Workout_History (
   id  SERIAL PRIMARY KEY,
   date  timestamp,
   workout_id  int,
   customer_id  int
);

CREATE TABLE Set (
   id  SERIAL PRIMARY KEY,
   workout_history_id  int,
   exercise_id  int,
   repetitions  int,
   distance  float,
   weight  float,
   time  float,
   set_number  int,
   type  exercise_type
);

CREATE TABLE Exercise_History (
   id  SERIAL PRIMARY KEY,
   workout_history_id  int
);

CREATE TABLE Set_History (
   id  SERIAL PRIMARY KEY,
   exercise_history_id  int,
   time  float,
   distance  float,
   weight  float,
   repetitions  int,
   set_number  int
);

ALTER TABLE Workout ADD FOREIGN KEY ( creator_id ) REFERENCES Person ( id );

ALTER TABLE Exercise ADD FOREIGN KEY ( creator_id ) REFERENCES Person ( id );

ALTER TABLE Person ADD FOREIGN KEY ( customer_id ) REFERENCES Customer ( id );

ALTER TABLE Person ADD FOREIGN KEY ( trainer_id ) REFERENCES Trainer ( id );

ALTER TABLE Customer ADD FOREIGN KEY ( trainer_id ) REFERENCES Trainer ( id );

ALTER TABLE Workout2Exercise ADD FOREIGN KEY ( workout_id ) REFERENCES Workout ( id );

ALTER TABLE Workout2Exercise ADD FOREIGN KEY ( exercise_id ) REFERENCES Exercise ( id );

ALTER TABLE Workout_History ADD FOREIGN KEY ( workout_id ) REFERENCES Workout ( id );

ALTER TABLE Workout_History ADD FOREIGN KEY ( customer_id ) REFERENCES Person ( id );

ALTER TABLE Set ADD FOREIGN KEY ( workout_history_id ) REFERENCES Workout_History ( id );

ALTER TABLE Set ADD FOREIGN KEY ( exercise_id ) REFERENCES Exercise ( id );

ALTER TABLE Exercise_History ADD FOREIGN KEY ( workout_history_id ) REFERENCES Workout_History ( id );

ALTER TABLE Set_History ADD FOREIGN KEY ( exercise_history_id ) REFERENCES Exercise_History ( id );

--ALTER TABLE  Set  ADD FOREIGN KEY ( set_number ) REFERENCES  Workout2Exercise  ( workout_id );

CREATE SEQUENCE hibernate_sequence START 1;
