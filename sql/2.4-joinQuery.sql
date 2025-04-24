DROP TABLE IF EXISTS orders ;

CREATE TABLE IF NOT EXISTS orders  (
    id INT PRIMARY KEY,
    customer_id INT,
    total DECIMAL DEFAULT 0
);

DROP TABLE IF EXISTS customers ;

CREATE TABLE IF NOT EXISTS customers  (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR,
    country VARCHAR
);

ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(id);

INSERT INTO customers (id, name, country) VALUES
(1, 'João', 'Brasil'),
(2, 'Maria', 'Argentina'),
(3, 'Pedro', 'Chile');

INSERT INTO orders (id, customer_id, total) VALUES
(1, 1, 5),
(2, 3, 10);

SELECT customers.name, orders.total
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
WHERE orders.total > 1
ORDER BY orders.total DESC;
