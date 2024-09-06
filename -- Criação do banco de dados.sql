-- Criação da tabela Books (Livros)
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year YEAR
);

-- Criação da tabela Users (Usuários)
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Criação da tabela Loans (Empréstimos)
CREATE TABLE IF NOT EXISTS Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Adicionando livros
INSERT INTO Books (title, author, genre, published_year) VALUES
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 1954),
('1984', 'George Orwell', 'Distopia', 1949),
('Dom Casmurro', 'Machado de Assis', 'Literatura Brasileira', 1899),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 1997);

-- Adicionando usuários
INSERT INTO Users (name, email) VALUES
('João da Silva', 'joao.silva@outlook.com'),
('Maria Oliveira', 'maria.oliveira@outlook.com'),
('Carlos Pereira', 'carlos.pereira@outlook.com'),
('Ana Souza', 'ana.souza@outlook.com');

-- Adicionando um novo livro
INSERT INTO Books (title, author, genre, published_year) VALUES
('O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 1937);

-- Atualizando informações de um livro
UPDATE Books
SET title = 'O Senhor dos Anéis: A Sociedade do Anel', genre = 'Fantasia Épica'
WHERE book_id = 1;

-- Excluindo um livro
DELETE FROM Books
WHERE book_id = 4;

-- Buscando livros
SELECT * FROM Books
WHERE title LIKE '%Senhor dos Anéis%'
   OR author LIKE '%Tolkien%'
   OR genre LIKE '%Fantasia%';

-- Adicionando um novo usuário
INSERT INTO Users (name, email) VALUES
('Pedro Alves', 'pedro.alves@outlook.com');

-- Atualizando informações de um usuário
UPDATE Users
SET email = 'pedro.alves123@outlook.com'
WHERE user_id = 5;

-- Excluindo um usuário
DELETE FROM Users
WHERE user_id = 5;

-- Buscando usuários
SELECT * FROM Users
WHERE name LIKE '%Pedro%'
   OR email LIKE '%outlook.com%';

-- Adicionando um novo empréstimo
INSERT INTO Loans (book_id, user_id, loan_date, return_date) VALUES
(1, 2, '2024-09-01', NULL); -- 'NULL' indica que o livro ainda não foi devolvido

-- Atualizando uma devolução de livro
UPDATE Loans
SET return_date = '2024-09-10'
WHERE loan_id = 1;

-- Relatório de livros emprestados
SELECT b.title, u.name, l.loan_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Users u ON l.user_id = u.user_id
WHERE l.return_date IS NULL;

-- Relatório de histórico de empréstimos de um usuário específico
SELECT b.title, l.loan_date, l.return_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
WHERE l.user_id = 2; -- Substitua '2' pelo ID do usuário desejado


