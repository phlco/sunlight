DROP TABLE politicians;

CREATE TABLE politicians;
(
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255),
  lastname VARCHAR(255),
  party text,
  phone text,
  state text,
  twitter_id text,
  in_office text,
  votesmart_id text
);


