-- Создание таблицы Авторы
CREATE TABLE Authors (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Создание таблицы Жанры
CREATE TABLE Genres (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Создание таблицы Книги
CREATE TABLE Books (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20),
    Title VARCHAR(255),
    PageCount INT,
    PublicationDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

-- Связующая таблица для связи Книг с Авторами
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(ID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

-- Связующая таблица для связи Книг с Жанрами
CREATE TABLE BookGenres (
    BookID INT,
    GenreID INT,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES Books(ID),
    FOREIGN KEY (GenreID) REFERENCES Genres(ID)
);

-- Вставка авторов
INSERT INTO Authors (FirstName, LastName) VALUES 
('Иван', 'Иванов'),
('Петр', 'Петров'),
('Александр', 'Сидоров');

-- Вставка жанров
INSERT INTO Genres (Name) VALUES 
('Фантастика'),
('Роман'),
('Детектив');

-- Вставка книг
INSERT INTO Books (ISBN, Title, PageCount, PublicationDate) VALUES 
('978-3-16-148410-0', 'Книга 1', 300, '2023-01-15'),
('978-3-16-148411-1', 'Книга 2', 250, '2023-02-20'),
('978-3-16-148412-2', 'Книга 3', 400, '2023-03-10');

-- Связи книг с авторами
INSERT INTO BookAuthors (BookID, AuthorID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(3, 1); -- Пример книги с несколькими авторами

-- Связи книг с жанрами
INSERT INTO BookGenres (BookID, GenreID) VALUES 
(1, 1),
(2, 2),
(3, 1),
(3, 3); -- Пример книги с отношением к разным жанрам

-- SQL-скрипт для вывода названия книги и ее авторов для жанра “Фантастика”
SELECT Books.Title, GROUP_CONCAT(Authors.FirstName, ' ', Authors.LastName) AS Authors
FROM Books
JOIN BookAuthors ON Books.ID = BookAuthors.BookID
JOIN Authors ON BookAuthors.AuthorID = Authors.ID
JOIN BookGenres ON Books.ID = BookGenres.BookID
JOIN Genres ON BookGenres.GenreID = Genres.ID
WHERE Genres.Name = 'Фантастика'
GROUP BY Books.Title;

-- SQL-скрипт для вывода автора, который написал больше всего книг
SELECT Authors.FirstName, Authors.LastName, COUNT(*) AS BookCount
FROM Authors
JOIN BookAuthors ON Authors.ID = BookAuthors.AuthorID
GROUP BY Authors.ID
ORDER BY BookCount DESC
LIMIT 1;
