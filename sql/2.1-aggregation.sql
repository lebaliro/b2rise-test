DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales (
    id INT PRIMARY KEY NOT NULL,
    product VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INT
);

INSERT INTO sales (id, product, price, quantity) VALUES
(1, 'Produto A', 10.00, 10),
(2, 'Produto B', 15.00, 5),
(3, 'Produto C', 20.00, 8);

SELECT product, 
       SUM(quantity * price) as total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;