-- Direccion de miembros que han pedido cierta categoria
SELECT street FROM Addresses
INNER JOIN Members
ON Addresses.address_id = Members.member_address_id
INNER JOIN Member_Requests
ON Member_Requests.member_id = Members.member_id
INNER JOIN Books
ON Books.isbn = Member_Requests.isbn
INNER JOIN Books_by_Category
ON Books_by_Category.isbn = Books.isbn
INNER JOIN Categories CA
ON CA.category_id = Books_by_Category.isbn
WHERE CA.category_name = 'Finance';

-- Libros de cierta categoria
SELECT book_title FROM Books
INNER JOIN Books_by_Category
ON Books.isbn = Books_by_Category.isbn
INNER JOIN Categories
ON Books_by_Category.category_id = Categories.category_id
WHERE Categories.category_name = 'Transportation';

-- Nombres de autores que alguno de sus libros no tienen stock
SELECT Authors.author_first_name, Authors.author_last_name FROM Authors
INNER JOIN Books_By_Author
ON Authors.author_id = Books_By_Author.author_id
INNER JOIN Books
ON Books.isbn = Books_By_Author.isbn
INNER JOIN Books_at_Libraries
ON Books_at_Libraries.isbn = Books.isbn
WHERE Books_at_Libraries.quantity_in_stock = 0;

-- 