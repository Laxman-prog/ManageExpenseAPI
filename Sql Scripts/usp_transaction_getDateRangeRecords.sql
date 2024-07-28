--Monthly transaction
CREATE PROCEDURE usp_transaction_getDateRangeRecords
	@StartDate DATE,
    @EndDate DATE,
    @UserId INT,
    @TransactionType NVARCHAR(10)

AS
BEGIN
    SELECT 
        Id,
        IncomeCategoryId,
        ExpenseCategoryId,
        Amount,
		[Description],
        TransactionDate,
        TransactionType
    FROM 
        [Transaction]
    WHERE 
        TransactionDate BETWEEN @StartDate AND @EndDate
        AND UserId = @UserId
        AND TransactionType = @TransactionType
    ORDER BY 
        TransactionDate ASC
END