PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY, 
  fname TEXT NOT NULL,
  lname TEXT NOT NULL

);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL, 
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  parent_reply INTEGER,
  author_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)

);

CREATE TABLE questions_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES question(id)

);


INSERT INTO
  users (fname, lname)
VALUES
  ('Mark', 'Cuban'),
  ('John', 'CENAAA');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('can you...', 'see me?', (SELECT id FROM users WHERE lname = 'CENAAA'));


-- INSERT INTO
--   questions_follows (user_id, question_id)
-- VALUES
--  ((SELECT id FROM users WHERE lname = 'Cuban'), (SELECT id FROM questions WHERE id = 1))

-- INSERT INTO 
--   replies (question_id, parent_reply, author_id, body)  
-- VALUES
--   (1, NULL, 1, "I cannot see you.")
--   ;

-- INSERT INTO 
--   replies (question_id, parent_reply, author_id, body)  
-- VALUES
--   (1, 1, 2, "You cannot see me.")
--   ;

INSERT INTO
  questions_likes (user_id, question_id)
VALUES
  (1, 1);

INSERT INTO
  questions_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE lname = 'CENAAA'), (SELECT id FROM questions WHERE id = 1))
  