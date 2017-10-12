-- create tables in database

CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY,
  emailAddress TEXT NOT NULL,
  numLicenseKeysSent INTEGER
);

CREATE TABLE IF NOT EXISTS license_keys (
  userID INTEGER NOT NULL,
  licenseKey TEXT NOT NULL,

  FOREIGN KEY (userID) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS orders (
  id INTEGER PRIMARY KEY,
  userID_customer INTEGER NOT NULL,
  userID_shop INTEGER NOT NULL,

  FOREIGN KEY (userID_customer) REFERENCES users(id),
  FOREIGN KEY (userID_shop) REFERENCES users(id)
);

-- the following creates dummy data:

INSERT INTO
  users (id, emailAddress)
VALUES
  (1, 'jill@email.com'),
  (2, 'john@email.com'),
  (3, 'andrew@email.com'),
  (4, 'jules@email.com'),
  (5, 'owen@email.com'),
  (6, 'troy@email.com'),
  (7, 'chris@email.com'),
  (8, 'sarah@email.com'),
  (9, 'jocelyn@email.com'),
  (10, 'franco@email.com');

-- INSERT INTO
--   license_keys (userID, licenseKey)
-- VALUES
--   ((SELECT userID FROM users WHERE emailAddress = 'jill@email.com'))
--   ;

INSERT INTO
  orders (id, userID_customer, userID_shop)
VALUES
  (123, (SELECT id FROM users WHERE emailAddress = 'jill@email.com'), (SELECT id FROM users WHERE emailAddress = 'andrew@email.com')),
  (456, (SELECT id FROM users WHERE emailAddress = 'john@email.com'), (SELECT id FROM users WHERE emailAddress = 'andrew@email.com')),
  (789, (SELECT id FROM users WHERE emailAddress = 'jules@email.com'), (SELECT id FROM users WHERE emailAddress = 'andrew@email.com'));