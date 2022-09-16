-- QUESTIONS TABLE --

CREATE TABLE IF NOT EXISTS questions (
  question_id SERIAL NOT NULL,
  question_body VARCHAR(1000) NOT NULL,
  question_date BIGINT NOT NULL,
  asker_name VARCHAR(60) NOT NULL,
  asker_email VARCHAR(100) NOT NULL,
  question_helpfulness INTEGER NOT NULL,
  reported BOOLEAN NOT NULL,
  product_id INTEGER NOT NULL,
  PRIMARY KEY (question_id)
);

-- ANSWERS TABLE --

CREATE TABLE IF NOT EXISTS answers (
  answer_id SERIAL NOT NULL,
  question_id INTEGER NOT NULL,
  body VARCHAR(1000) NOT NULL,
  date BIGINT NOT NULL,
  answerer_name VARCHAR(60) NOT NULL,
  answerer_email VARCHAR(100) NOT NULL,
  reported BOOLEAN NOT NULL,
  helpfulness INTEGER NOT NULL,
  PRIMARY KEY (answer_id)
);

-- ANSWER PHOTOS TABLE --

CREATE TABLE IF NOT EXISTS photos (
  id SERIAL,
  answer_id INTEGER NOT NULL,
  url VARCHAR(1000) NOT NULL,
  PRIMARY KEY (id)
-- );

-- CREATING FOREGIN KEYS --

ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions (question_id);
ALTER TABLE photos ADD FOREIGN KEY (answer_id) REFERENCES answers (answer_id);

-- COPY CSV INTO DB --

COPY questions (question_id, product_id, question_body, question_date, asker_name, asker_email, reported, question_helpfulness)
FROM '/home/pko/HackReactor/systemdesigncapstone/CSV Files/questions.csv'
DELIMITER ','
CSV HEADER;

COPY answers (answer_id, question_id, body, date, answerer_name, answerer_email, reported, helpfulness)
FROM '/home/pko/HackReactor/systemdesigncapstone/CSV Files/answers.csv'
DELIMITER ','
CSV HEADER;

COPY photos (id, product_id, url)
FROM '/home/pko/HackReactor/systemdesigncapstone/CSV Files/answers_photos.csv'
DELIMITER ','
CSV HEADER;

-- CREATING INDEX --

CREATE INDEX IF NOT EXISTS question_id ON questions(question_id);
CREATE INDEX IF NOT EXISTS answer_id ON answers(answer_id);