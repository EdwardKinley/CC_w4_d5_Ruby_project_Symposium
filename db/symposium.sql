DROP TABLE registrations;
DROP TABLE presentations;
DROP TABLE delegates;

CREATE TABLE delegates
(
  id SERIAL2 primary key,
  name VARCHAR(255) not null,
  board_member BOOLEAN
);

CREATE TABLE presentations
(
  id SERIAL2 primary key,
  name VARCHAR(255) not null unique,
  time_slot INT2 not null,
  capacity INT2 not null
);

CREATE TABLE registrations
(
  id SERIAL2 primary key,
  presentation_id INT2 references presentations(id) ON DELETE CASCADE,
  delegate_id INT8 references delegates(id) ON DELETE CASCADE
);
