CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT,
  password TEXT
);

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  user_id INT,
  balance NUMERIC
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  from_account INT,
  to_account INT,
  amount NUMERIC,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password) VALUES ('user1', 'password');
INSERT INTO accounts (user_id, balance) VALUES (1, 1000000000000);