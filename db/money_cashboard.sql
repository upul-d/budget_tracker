DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants (
  merchant_id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  tag_id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  transaction_id SERIAL8 PRIMARY KEY,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(merchant_id),
  tag_id INT8 REFERENCES tags(tag_id)
);