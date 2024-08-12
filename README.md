# Library Management System

## Overview

The **Library Management System** is a simple database project implemented using MySQL. The system manages books, members, and book issuances, allowing basic CRUD (Create, Read, Update, Delete) operations on these entities. This project is ideal for beginners to get hands-on experience with MySQL and practice SQL queries.

## Features

- **Books Management:** Add, view, update, and delete book records.
- **Members Management:** Manage library members by storing and retrieving their details.
- **Book Issuance:** Track which member has borrowed which book and when, with the option to return books.
- **Advanced Queries:** Find all books issued to a specific member, check for overdue books, and count available copies of each book.

## Prerequisites

Before running the project, ensure you have the following installed on your system:

- [MySQL](https://dev.mysql.com/downloads/installer/) 
- [Python](https://www.python.org/downloads/)
- [MySQL Connector for Python](https://pypi.org/project/mysql-connector-python/): `pip install mysql-connector-python`

## Project Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/library-management-system.git
   cd library-management-system
