--Monthly transaction
CREATE PROCEDURE usp_transaction_getMonthlyTab
	@Year INT,
    @Month INT,
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
        AND MONTH(TransactionDate) = @Month
        AND UserId = @UserId
        AND TransactionType = @TransactionType
    ORDER BY 
        TransactionDate ASC
END