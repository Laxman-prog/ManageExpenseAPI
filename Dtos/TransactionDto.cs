namespace Expense.Manager.API.Dtos;

public class TransactionDto : BaseDto
{
    public int UserId { get; set; }
    public int IncomeCategoryId { get; set; }
    public int ExpenseCategoryId { get; set; }
    public decimal Amount { get; set; }
    public string? Description { get; set; }
    public DateTime TransactionDate { get; set; }
    public string TransactionType { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
