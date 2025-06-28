-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(20)
);

-- Groups table
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  owner_id INTEGER REFERENCES users(id)
);

-- Events table
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  datetime TIMESTAMP,
  location VARCHAR(512),
  notes TEXT
);

-- Event attendance table
CREATE TABLE event_attendance (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  user_id INTEGER REFERENCES users(id),
  rsvp_status VARCHAR(20)
);

-- Setlists table
CREATE TABLE setlists (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  name VARCHAR(255),
  data TEXT
);

-- Chat messages table
CREATE TABLE chat_messages (
  id SERIAL PRIMARY KEY,
  group_id INTEGER REFERENCES groups(id),
  user_id INTEGER REFERENCES users(id),
  message TEXT,
  sent_at TIMESTAMP DEFAULT now()
);

-- Attachments table
CREATE TABLE attachments (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  filename VARCHAR(255),
  url TEXT
);