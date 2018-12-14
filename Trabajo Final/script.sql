CREATE TABLE Addresses(
    address_id serial PRIMARY KEY,
    line1_number_building int,
    line2_number_street text,
    line_3_area_locality text,
    city text,
    zip_postcode int,
    country text
);

CREATE TABLE Members(
    member_id serial PRIMARY KEY,
    member_address_id int,
    FOREIGN KEY (member_address_id) REFERENCES Addresses(address_id) ON DELETE CASCADE,
    gender text,
    phone_number int,
    email_address text
);

CREATE TABLE Books(
    isbn int PRIMARY KEY,
    book_title text,
    date_of_publication date
);

CREATE TABLE Categories(
    category_id serial PRIMARY KEY,
    category_name text
);

CREATE TABLE Books_by_Category(
    category_id int,
    isbn int,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (isbn) REFERENCES Books(isbn),
    PRIMARY KEY (category_id, isbn)
);
CREATE TABLE Member_Requests(
    request_id serial PRIMARY KEY,
    member_id int,
    isbn int,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (isbn) REFERENCES Books(isbn) ON DELETE CASCADE,
    date_requested date,
    date_located date
);

CREATE TABLE Libraries(
    library_id serial PRIMARY KEY,
    address_id int,
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id) ON DELETE CASCADE,
    library_name text,
    library_details text
);

CREATE TABLE Books_at_Libraries(
    library_id int,
    isbn int,
    FOREIGN KEY (library_id) REFERENCES Libraries(library_id) ON DELETE CASCADE,
    FOREIGN KEY (isbn) REFERENCES Books(isbn) ON DELETE CASCADE,
    quantity_in_stock int
);

CREATE TABLE Authors(
	author_id serial PRIMARY KEY,
	author_first_name text,
	author_last_name text
);

CREATE TABLE Books_By_Author(
	author_id int,
	isbn int,
	FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE,
	FOREIGN KEY (isbn) REFERENCES Books(isbn) ON DELETE CASCADE,
	PRIMARY KEY (author_id,isbn)
);




