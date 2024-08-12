-- Step 1: Create the Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Step 2: Create Tables

-- 2.1: Create the Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),             -- Title of the book
    Author VARCHAR(100),            -- Author of the book
    Genre VARCHAR(50),              -- Genre of the book
    PublishedYear INT,              -- Year the book was published
    AvailableCopies INT             -- Number of available copies in the library
);

-- 2.2: Create the Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),          -- Member's first name
    LastName VARCHAR(50),           -- Member's last name
    Email VARCHAR(100),             -- Member's email address
    PhoneNumber VARCHAR(15),        -- Member's phone number
    JoinDate DATE                   -- Date the member joined the library
);

-- 2.3: Create the IssuedBooks Table
CREATE TABLE IssuedBooks (
    IssueID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,                     -- Foreign key to the Books table
    MemberID INT,                   -- Foreign key to the Members table
    IssueDate DATE,                 -- Date the book was issued
    ReturnDate DATE,                -- Date the book was returned
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Step 3: Insert Sample Data

-- 3.1: Insert Books
INSERT INTO Books (Title, Author, Genre, PublishedYear, AvailableCopies)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5),
('1984', 'George Orwell', 'Dystopian', 1949, 3),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 4),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 2);

-- 3.2: Insert Members
INSERT INTO Members (FirstName, LastName, Email, PhoneNumber, JoinDate)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2023-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2023-02-20');

-- 3.3: Issue a Book
INSERT INTO IssuedBooks (BookID, MemberID, IssueDate, ReturnDate)
VALUES
(1, 1, '2023-08-01', NULL),         -- Book with BookID 1 issued to Member with MemberID 1
(2, 2, '2023-08-05', '2023-08-12'); -- Book with BookID 2 issued to Member with MemberID 2

-- Step 4: Perform CRUD Operations

-- 4.1: Retrieve All Books
SELECT * FROM Books;

-- 4.2: Add a New Book
INSERT INTO Books (Title, Author, Genre, PublishedYear, AvailableCopies)
VALUES ('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 7);

-- 4.3: Update Book Information
UPDATE Books
SET AvailableCopies = 6
WHERE BookID = 1;

-- 4.4: Delete a Book
DELETE FROM Books
WHERE BookID = 4;

-- 4.5: Retrieve All Issued Books
SELECT IssueID, Title, FirstName, LastName, IssueDate, ReturnDate
FROM IssuedBooks
JOIN Books ON IssuedBooks.BookID = Books.BookID
JOIN Members ON IssuedBooks.MemberID = Members.MemberID;

-- Step 5: Advanced Queries

-- 5.1: Find All Books Issued to a Particular Member
SELECT Title, IssueDate
FROM IssuedBooks
JOIN Books ON IssuedBooks.BookID = Books.BookID
WHERE MemberID = 1;

-- 5.2: Count of Available Copies of Each Book
SELECT Title, AvailableCopies
FROM Books;

-- 5.3: Check for Overdue Books
SELECT Title, FirstName, LastName, IssueDate, ReturnDate
FROM IssuedBooks
JOIN Books ON IssuedBooks.BookID = Books.BookID
JOIN Members ON IssuedBooks.MemberID = Members.MemberID
WHERE ReturnDate IS NULL AND IssueDate < CURDATE() - INTERVAL 14 DAY;
