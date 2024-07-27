namespace Expense.Manager.API.Dtos;

public class IncomeCategoryDto : BaseDto
{
    public string CategoryName { get; set; } = string.Empty;
    public string IconName { get; set; } = string.Empty;
    public int UserId { get; set; }
}
