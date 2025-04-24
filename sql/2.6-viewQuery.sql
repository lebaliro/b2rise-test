DROP TABLE IF EXISTS transactions CASCADE;

CREATE TABLE IF NOT EXISTS transactions (
    id INT PRIMARY KEY NOT NULL,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL
);

INSERT INTO transactions (id, account_id, transaction_date, amount) VALUES
(1, 1, '2025-07-23', 10000),
(2, 1, '2025-02-24', 20000),
(3, 2, '2025-03-06', 15000),
(4, 2, '2025-04-15', 25000),
(5, 1, '2025-02-24', 500),
(6, 2, '2025-03-24', 150),
(7, 3, '2025-01-24', 725);


CREATE VIEW monthly_summary AS (
    SELECT account_id, EXTRACT(MONTH FROM transaction_date) as month, SUM(amount) as total_amount
    FROM transactions
    GROUP BY account_id, EXTRACT(MONTH FROM transaction_date)
);

SELECT * FROM monthly_summary;

SELECT * FROM monthly_summary
WHERE total_amount > 10000;