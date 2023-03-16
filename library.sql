CREATE TABLE Publishers (
  PublisherId INTEGER PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
  BookId INTEGER PRIMARY KEY AUTOINCREMENT,
  Title  VARCHAR(255) NOT NULL,
  Description VARCHAR(255),
  PublicationDate DATE,
  PublisherId INTEGER,
  DDC VARCHAR(255),
  PageNumber Type,
  FOREIGN KEY (PublisherId) REFERENCES Publishers(PublisherId)
);

CREATE TABLE Authors (
  AuthorId INTEGER PRIMARY KEY AUTOINCREMENT,
  FirstName VARCHAR(60) NOT NULL,
  LastName VARCHAR(60) NOT NULL,
  Birthdate DATE,
  Country VARCHAR(255)
);

CREATE TABLE bookAuthor (
  BookId INTEGER,
  AuthorId INTEGER,
  FOREIGN KEY (BookId) REFERENCES Books(BookId),
  FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);

CREATE TABLE Languages (
  LanguageId INTEGER PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(60) NOT NULL
);

CREATE TABLE Staff (
  StaffId INTEGER PRIMARY KEY AUTOINCREMENT,
  FirstName VARCHAR(60) NOT NULL,
  LastName VARCHAR(60) NOT NULL,
  Birthdate DATE,
  Email VARCHAR(255) NOT NULL UNIQUE,
  Address VARCHAR(255),
  Phone VARCHAR(15) NOT NULL UNIQUE,
  JobTitle VARCHAR(20),
  SSN CHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Genres (
  GenreId INTEGER PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(60) NOT NULL,
  Description VARCHAR(255)
);

CREATE TABLE bookGenre (
  BookId INTEGER,
  GenreId INTEGER,
  FOREIGN KEY (BookId) REFERENCES Books(BookId),
  FOREIGN KEY (GenreId) REFERENCES Genres(GenreId)
);

CREATE TABLE Customers (
  CustomerId INTEGER PRIMARY KEY AUTOINCREMENT,
  FirstName VARCHAR(60) NOT NULL,
  LastName VARCHAR(60) NOT NULL,
  Phone VARCHAR(15) NOT NULL,
  Email VARCHAR(255),
  SSN CHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Suppliers (
  SupplierId INTEGER PRIMARY KEY AUTOINCREMENT,
  Name VARCHAR(255) NOT NULL,
  ContactName VARCHAR(255),
  Email VARCHAR(255),
  Phone VARCHAR(255) NOT NULL,
  Address VARCHAR(255)
);

CREATE TABLE bookLanguage (
  BookId INTEGER,
  LanguageId INTEGER,
  FOREIGN KEY (BookId) REFERENCES Books(BookId),
  FOREIGN KEY (LanguageId) REFERENCES Languages(LanguageId)
);

CREATE TABLE bookSupplier (
  BookId INTEGER,
  SupplierId INTEGER,
  FOREIGN KEY (BookId) REFERENCES Books(BookId),
  FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);

CREATE TABLE bookLoans (
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  LoanId INTEGER,
  BookId INTEGER,
  CustomerId INTEGER,
  Beginning TIMESTAMP NOT NULL,
  End TIMESTAMP NOT NULL,
  ReturnDate DATE NOT NULL,
  FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
  FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

CREATE TABLE Stock (
  StockId INTEGER PRIMARY KEY AUTOINCREMENT,
  BookId INTEGER,
  Amount SMALLINT NOT NULL,
  FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

INSERT INTO Books(Title,Description,PublicationDate,DDC,PageNumber, PublisherId) VALUES
('The Great Gatsby', 'A novel by F. Scott Fitzgerald', '1925-04-10', '813/.52', 180, 1),
('To Kill a Mockingbird', 'A novel by Harper Lee', '1960-07-11', '813/.54', 281, 2),
('1984', 'A dystopian novel by George Orwell', '1949-06-08', '823/.912', 328, 3),
('The Catcher in the Rye', 'A novel by J. D. Salinger', '1951-07-16', '813/.54', 277, 4),
('Pride and Prejudice', 'A novel by Jane Austen', '1813-01-28', '823/.7', 279, 5),
('The Hobbit', 'A novel by J. R. R. Tolkien', '1937-09-21', '823/.912', 310, 6),
('The Lord of the Rings', 'A novel by J. R. R. Tolkien', '1954-07-29', '823/.912', 1178, 6),
('The Da Vinci Code', 'A novel by Dan Brown', '2003-03-18', '813/.54', 454, 7),
('The Hunger Games', 'A novel by Suzanne Collins', '2008-09-14', '813/.6', 374, 8),
('The Lord of the Rings', 'A novel by J. R. R. Tolkien', '1954-07-29', '823/.912', 1178, 6),
('The Silmarillion', 'A collection of J. R. R. Tolkien writings', '1977-09-15', '823/.912', 365, 6),
('The Hobbit and The Lord of the Rings', 'A boxed set of J. R. R. Tolkien novels', '1991-11-15', '823/.912', 1137, 6),
('The History of Middle-earth', 'A 12-volume series of J. R. R. Tolkien writings', '1983-10-01', '823/.912', 4819, 6),
('Farmer Giles of Ham', 'A novella by J. R. R. Tolkien', '1949-10-27', '823/.912', 79, 6),
('Leaf by Niggle', 'A short story by J. R. R. Tolkien', '1947-01-01', '823/.912', 54, 6),
('Unfinished Tales of Númenor and Middle-earth', 'A collection of J. R. R. Tolkien writings', '1980-10-02', '823/.912', 472, 6),
('The Children of Húrin', 'A novel by J. R. R. Tolkien, edited by Christopher Tolkien', '2007-04-17', '823/.912', 313, 6),
('Bilbo\s Last Song', 'A poem by J. R. R. Tolkien, illustrated by Pauline Baynes', '1990-10-24', '823/.912', 32, 6),
('The Fall of Gondolin', 'A novel by J. R. R. Tolkien, edited by Christopher Tolkien', '2018-08-30', '823/.912', 304, 6),
('The Legend of Sigurd and Gudrun', 'A poem by J. R. R. Tolkien, edited by Christopher Tolkien', '2009-05-05', '821/.912', 377, 6),
('The Letters of J. R. R. Tolkien', 'A collection of J. R. R. Tolkien letters, edited by Humphrey Carpenter', '1981-06-11', '826/.912', 463, 6),
('The Road Goes Ever On', 'A song cycle with poems by J. R. R. Tolkien, music by Donald Swann', '1968-10-31', '782.42/2', 80, 6),
('The Monsters and the Critics and Other Essays', 'A collection of J. R. R. Tolkien essays, edited by Christopher Tolkien', '1983-02-24', '820/.9/12', 248, 6),
('Smith of Wootton Major', 'A novella by J. R. R. Tolkien, illustrated by Pauline Baynes', '1967-11-02', '823/.912', 57, 6),
('Tales from the Perilous Realm', 'A collection of J. R. R. Tolkien short stories, edited by Christopher Tolkien', '1991-10-15', '823/.912', 365, 6),
('Tree and Leaf', 'A collection of J. R. R. Tolkien essays, including "On Fairy-Stories"', '1964-09-10', '828/.9/12', 92, 6),
('The Book of Lost Tales', 'A two-volume series of J. R. R. Tolkien writings, edited by Christopher Tolkien', '1983-10-01', '823/.912', 704, 6),
('Harry Potter and the Philosophers Stone', 'The first book in the Harry Potter series by J.K. Rowling', '1997-06-26', '823.914', 223,  9),
('Harry Potter and the Chamber of Secrets', 'The second book in the Harry Potter series by J.K. Rowling', '1998-07-02', '823.914', 251,  9),
('Harry Potter and the Prisoner of Azkaban', 'The third book in the Harry Potter series by J.K. Rowling', '1999-07-08', '823.914', 317,  9),
('Harry Potter and the Goblet of Fire', 'The fourth book in the Harry Potter series by J.K. Rowling', '2000-07-08', '823.914', 636,  9),
('Harry Potter and the Order of Phoenix', 'The fifth book in the Harry Potter series by J.K. Rowling', '2003-06-21', '823.914', 766,  9),
('Harry Potter and the Half-Blood Prince', 'The sixth book in the Harry Potter series by J.K. Rowling', '2005-07-16', '823.914', 607,  9),
('Harry Potter and the Deathly Hallows', 'The seventh and final book in the Harry Potter series by J.K. Rowling', '2007-07-21', '823.914', 607,  9),
('A Brief History of Time', 'A popular science book by Stephen Hawking', '1988-09-01', '530.11', 212,  9),
('The Casual Vacancy', 'A novel by J.K. Rowling', '2012-09-27', '823.92', 512,  9),
('The Testaments', 'A novel by Margaret Atwood and the sequel to The Handmaids Tale', '2019-09-10', '813.54', 432,  9),
('Catching Fire', 'The second book in The Hunger Games trilogy by Suzanne Collins', '2009-09-01', '813.6', 391,  8),
('Mockingjay', 'The third and final book in The Hunger Games trilogy by Suzanne Collins', '2010-08-24', '813.6', 390,  8);

INSERT INTO Publishers ( Name ) VALUES 
('Charles Scribners Sons'),('J. B. Lippincott & Co.'),('Secker & Warburg'),
( 'Little, Brown and Company'),('T. Egerton, Whitehall'),( 'George Allen & Unwin'),
( 'Doubleday'),('Scholastic'),('Bloomsbury Publishing')

INSERT INTO Genres(Name, Description) VALUES 
('Science Fiction', 'Speculative fiction that deals with imaginative and futuristic concepts'),
('Fantasy', 'A genre of speculative fiction set in a fictional universe'),
('Mystery', 'A genre of fiction that involves a crime, puzzle, or problem to be solved'),
('Thriller', 'A genre of fiction characterized by suspense and excitement'),
('Romance', 'A genre of fiction that focuses on love and romantic relationships'),
('Historical Fiction', 'A genre of fiction set in a particular historical period'),
('Young Adult', 'A genre of fiction aimed at readers between the ages of 12 and 18'),
('Horror', 'A genre of fiction intended to frighten, scare, or disgust the reader'),
('Crime', 'A genre of fiction that involves crime and the criminal justice system'),
('Adventure', 'A genre of fiction that involves action and excitement in exotic or dangerous settings'),
('Action', 'A genre of fiction that involves physical or violent activity, often in a fast-paced plot'),
('Comedy', 'A genre of fiction intended to be humorous or amusing'),
('Drama', 'A genre of fiction that involves serious, often emotional, subjects'),
('Memoir', 'A genre of non-fiction that focuses on the personal experiences of the author'),
('Biography', 'A genre of non-fiction that tells the life story of a person'),
('Autobiography', 'A genre of non-fiction that tells the life story of the author'),
('History', 'A genre of non-fiction that focuses on past events and their significance'),
('Politics', 'A genre of non-fiction that deals with government and power'),
('Philosophy', 'A genre of non-fiction that deals with the study of the nature of reality and existence'),
('Self-Help', 'A genre of non-fiction that provides advice and guidance on personal growth and improvement');

INSERT INTO Authors(FirstName,LastName,Birthdate,Country) VALUES 
('F. Scott', 'Fitzgerald', '1896-09-24', 'United States'),
('Harper', 'Lee', '1926-04-28', 'United States'),
('George', 'Orwell', '1903-06-25', 'United Kingdom'),
('J.D.', 'Salinger', '1919-01-01', 'United States'),
('Jane', 'Austen', '1775-12-16', 'United Kingdom'),
('J.R.R.', 'Tolkien', '1892-01-03', 'United Kingdom'),
('Dan', 'Brown', '1964-06-22', 'United States'),
('Suzanne', 'Collins', '1962-08-10', 'United States'),

 

