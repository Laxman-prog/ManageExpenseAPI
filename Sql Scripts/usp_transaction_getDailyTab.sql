--Daily transactions.
CREATE PROCEDURE usp_transaction_getDailyTab
	@Date DATETIME,
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
        CAST(TransactionDate AS DATE) = @Date
        AND UserId = @UserId
        AND TransactionType = @TransactionType
    ORDER BY 
        TransactionDate ASC
END