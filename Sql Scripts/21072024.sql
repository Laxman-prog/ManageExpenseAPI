DROP TABLE Transactions 
DROP TABLE Settings
DROP TABLE ExpenseCategories
DROP TABLE IncomeCategories
 DROP TABLE USERS 
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
	PhoneNumber NVARCHAR(14) NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE IncomeCategories (
    IncomeCategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    IconName NVARCHAR(100) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE ExpenseCategories (
    ExpenseCategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    IconName NVARCHAR(100) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    IncomeCategoryId INT,
    ExpenseCategoryId INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Description NVARCHAR(255),
    TransactionDate DATE NOT NULL,
    TransactionType NVARCHAR(10) CHECK (TransactionType IN ('Income', 'Expense')) NOT NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE(),
    UpdatedAt DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (IncomeCategoryId) REFERENCES IncomeCategories(IncomeCategoryId),
    FOREIGN KEY (ExpenseCategoryId) REFERENCES ExpenseCategories(ExpenseCategoryId)
);

CREATE TABLE Settings (
    SettingId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    Currency NVARCHAR(10) DEFAULT 'INR',
	[Language] NVARCHAR(100) DEFAULT 'English',
	[DateFormat] NVARCHAR(8) DEFAULT 'dd-MM-yyyy',
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Index on TransactionDate for faster date range queries
CREATE INDEX IX_Transactions_TransactionDate
ON Transactions(TransactionDate);

-- Composite index on UserId and TransactionDate for user-specific date range queries
CREATE INDEX IX_Transactions_UserId_TransactionDate
ON Transactions(UserId, TransactionDate);

-- Index on TransactionType for filtering by Income or Expense
CREATE INDEX IX_Transactions_TransactionType
ON Transactions(TransactionType);

-- Index on Amount for queries involving the transaction amount
CREATE INDEX IX_Transactions_Amount
ON Transactions(Amount);

-- Index on IncomeCategoryId for category-specific queries
CREATE INDEX IX_Transactions_IncomeCategoryId
ON Transactions(IncomeCategoryId);

-- Index on ExpenseCategoryId for category-specific queries
CREATE INDEX IX_Transactions_ExpenseCategoryId
ON Transactions(ExpenseCategoryId);
