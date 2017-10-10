CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  email_address TEXT NOT NULL,
  num_license_keys_sent INTEGER,
);

CREATE TABLE license_keys (
  user_id INTEGER NOT NULL,
  license_key INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  shop_id INTEGER NOT NULL,

  FOREIGN KEY (customer_id) REFERENCES users(id),
  FOREIGN KEY (shop_id) REFERENCES users(id)
);

INSERT INTO
  users (email_address)
VALUES
  ('jill@email.com'),
  ('john@email.com'),
  ('andrew@email.com'),
  ('jules@email.com'),
  ('owen@email.com'),
  ('troy@email.com'),
  ('chris@email.com'),
  ('sarah@email.com'),
  ('jocelyn@email.com'),
  ('franco@email.com')
  ;

INSERT INTO
  license_keys ()
VALUES
  ;

INSERT INTO
  orders ()
VALUES
;