DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales (
    id INT PRIMARY KEY NOT NULL,
    product_id INT,
    quantity INT
);

DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR,
    category_id INT
);

DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR
);

ALTER TABLE sales
ADD CONSTRAINT fk_product_id
FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE products
ADD CONSTRAINT fk_category_id
FOREIGN KEY (category_id) REFERENCES categories(id);

INSERT INTO categories (id, name) VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Alimentos');


INSERT INTO products (id, name, category_id) VALUES
(1, 'Computador', 1),
(2, 'Celular', 1),
(3, 'Camiseta', 2),
(4, 'Calça', 2),
(5, 'Arroz', 3),
(6, 'Feijão', 3);

INSERT INTO sales (id, product_id, quantity) VALUES
(1, 1, 30),
(2, 2, 200),
(3, 3, 300),
(4, 4, 100),
(5, 5, 20),
(6, 6, 2000);

SELECT c.name as category, p.name as product, s.quantity
FROM sales s
INNER JOIN products p ON s.product_id = p.id
INNER JOIN categories c ON p.category_id = c.id
WHERE s.quantity > 100;
