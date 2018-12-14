CREATE ROLE Author;
CREATE ROLE Librarian;
CREATE ROLE Buyer;

-- Muestra los libros junto con los nombres de autores
CREATE VIEW buyer_view AS 
SELECT Authors.author_first_name, Authors.author_last_name, Books.book_title, Books.isbn
FROM Authors
INNER JOIN Books_by_Author
ON Books_by_Author.author_id = Authors.author_id
INNER JOIN Books
ON Books.isbn = Books_by_Author.isbn;

GRANT USAGE ON SCHEMA buyer_view TO Buyer;