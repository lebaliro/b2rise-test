DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY NOT NULL,
    email VARCHAR,
    name VARCHAR
);

--- 2 5 7

INSERT INTO users (id, email, name) VALUES
(1, 'teste1@teste.com', 'Teste'),
(2, 'teste2@teste.com', 'Teste'),
(3, 'teste2@teste.com', 'Teste'),
(4, 'teste3@teste.com', 'Teste'),
(5, 'teste4@teste.com', 'Teste'),
(6, 'teste5@teste.com', 'Teste'),
(7, 'teste5@teste.com', 'Teste'),
(8, 'teste7@teste.com', 'Teste'),
(9, 'teste7@teste.com', 'Teste'),
(10, 'teste9@teste.com', 'Teste'),
(11, 'teste10@teste.com', 'Teste');

--Escreva uma query para identificar os emails que estão duplicados, juntamente com o número de ocorrências.

SELECT email, COUNT(*) as total_duplicados
FROM users
GROUP BY email
HAVING COUNT(*) > 1;