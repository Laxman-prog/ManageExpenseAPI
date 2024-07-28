--Monthly transaction
CREATE PROCEDURE usp_transaction_getYearlyTab
	@Year INT,
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
        YEAR(TransactionDate) = @Year
        AND UserId = @UserId
        AND TransactionType = @TransactionType
    ORDER BY 
        TransactionDate ASC
END