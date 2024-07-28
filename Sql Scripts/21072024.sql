DROP TABLE dbo.[Transaction]
DROP TABLE Settings
DROP TABLE ExpenseCategories
DROP TABLE IncomeCategories
 DROP TABLE [User] 
CREATE TABLE [User] (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
	PhoneNumber NVARCHAR(14) NULL,
    CreatedAt DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE IncomeCategory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    IconName NVARCHAR(100) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES [User](Id)
);

CREATE TABLE ExpenseCategory (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL,
    IconName NVARCHAR(100) NOT NULL,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES [User](Id)
);

CREATE TABLE [Transaction] (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    IncomeCategoryId INT,
    ExpenseCategoryId INT,
    Amount DECIMAL(10, 2) NOT NULL,
    Description NVARCHAR(255),
    TransactionDate DATETIME NOT NULL,
    TransactionType NVARCHAR(10) CHECK (TransactionType IN ('Income', 'Expense')) NOT NULL,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [User](Id),
    FOREIGN KEY (IncomeCategoryId) REFERENCES IncomeCategory(Id),
    FOREIGN KEY (ExpenseCategoryId) REFERENCES ExpenseCategory(Id)
);

CREATE TABLE Setting (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    Currency NVARCHAR(10) DEFAULT 'INR',
	[Language] NVARCHAR(100) DEFAULT 'English',
	[DateFormat] NVARCHAR(8) DEFAULT 'dd-MM-yyyy',
    FOREIGN KEY (UserId) REFERENCES [User](Id)
);

-- Index on TransactionDate for faster date range queries
CREATE INDEX IX_Transactions_TransactionDate
ON [Transaction](TransactionDate);

-- Composite index on UserId and TransactionDate for user-specific date range queries
CREATE INDEX IX_Transactions_UserId_TransactionDate
ON [Transaction](UserId, TransactionDate);

-- Index on TransactionType for filtering by Income or Expense
CREATE INDEX IX_Transactions_TransactionType
ON [Transaction](TransactionType);

-- Index on Amount for queries involving the transaction amount
CREATE INDEX IX_Transactions_Amount
ON [Transaction](Amount);

-- Index on IncomeCategoryId for category-specific queries
CREATE INDEX IX_Transactions_IncomeCategoryId
ON [Transaction](IncomeCategoryId);

-- Index on ExpenseCategoryId for category-specific queries
CREATE INDEX IX_Transactions_ExpenseCategoryId
ON [Transaction](ExpenseCategoryId);
