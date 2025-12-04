DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    categoryId INTEGER,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    isbn VARCHAR(20),
    price REAL,
    image VARCHAR(100),
    readNow INTEGER,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);


INSERT INTO categories (id, name) VALUES
(1, 'Fantasy'),
(2, 'Mystery'),
(3, 'Science Fiction'),
(4, 'Romance');

INSERT INTO books (id, categoryId, title, author, isbn, price, image, readNow) VALUES
(1, 1, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', '13-9780590353427', 9.50, 'Harry Potter and the Sorcerer''s Stone.png', 1),
(2, 1, 'The Lord of the Rings: The Fellowship of the Ring', 'J.R.R. Tolkien', '13-9780547928210', 10.41, 'The Lord of the The Fellowship of the Ring.png', 0),
(3, 1, 'A Game of Thrones', 'George R. R. Martin', '13-9780553593716', 18.00, 'A Game of Thrones.png', 0),
(4, 1, 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', 'C.S. Lewis', '13-9780064471046', 8.99, 'The Chronicles of Narnia.png', 0),

(5, 2, 'The Da Vinci Code', 'Dan Brown', '13-9780307474278', 9.99, 'The Da Vinci Code.png', 0),
(6, 2, 'And Then There Were None', 'Agatha Christie', '13-9780062073488', 10.99, 'And Then There Were None.png', 1),
(7, 2, 'Gone Girl', 'Gillian Flynn', '13-9780307588371', 9.99, 'Gone Girl.png', 0),
(8, 2, 'Sherlock Holmes: The Hound of the Baskervilles', 'Arthur Conan Doyle', '13-9780141034324', 10.99, 'Sherlock Holmes.png', 0),

(9, 3, 'Dune', 'Frank Herbert', '13-9780593099322', 10.99, 'Dune.png', 1),
(10, 3, '1984', 'George Orwell', '13-9780451524935', 9.99, '1984.png', 0),
(11, 3, 'The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', '13-9780345391803', 8.99, 'The Hitchhiker''s Guide to the Galaxy.png', 0),
(12, 3, 'Ender''s Game', 'Orson Scott Card', '13-9780812550702', 10.99, 'Ender''s Game.png', 0),

(13, 4, 'Pride and Prejudice', 'Jane Austen', '13-9780141439518', 9.99, 'Pride and Prejudice.png', 1),
(14, 4, 'The Notebook', 'Nicholas Sparks', '13-9781455582877', 9.99, 'The Notebook.png', 0),
(15, 4, 'Me Before You', 'Jojo Moyes', '13-9780143130154', 10.99, 'Me Before You.png', 1),
(16, 4, 'Gone with the Wind', 'Margaret Mitchell', '13-9781451635621', 22.00, 'Gone with the Wind.png', 0);

