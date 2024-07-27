using AutoMapper;
using Expense.Manager.API.Dtos;
using Expense.Manager.Application.IServices;
using Expense.Manager.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Expense.Manager.API.Controllers;

public class ExpenseCategoryController : ExpenseBaseController
{
    private readonly IExpenseCatagoryService expenseCatagoryService;
    private readonly IMapper mapper;
    public ExpenseCategoryController(IExpenseCatagoryService expenseCatagoryService, IMapper mapper)
    {
        this.mapper = mapper;
        this.expenseCatagoryService = expenseCatagoryService;
    }

    [HttpGet]
    [Route("[action]")]
    public async Task<IActionResult> GetAllExpenseCategories()
    {
        var result = await expenseCatagoryService.GetExpenseCategories();
        return Ok(mapper.Map<IReadOnlyList<IncomeCategoryDto>>(result));
    }

    [HttpPost]
    [Route("[action]")]
    public async Task<IActionResult> UpsertExpenseCategory([FromBody] IncomeCategoryDto expenseCategoryDto)
    {
        var expense = mapper.Map<ExpenseCategory>(expenseCategoryDto);
        var result = await expenseCatagoryService.UpsertExpenseCategory(expense);
        return Ok(mapper.Map<IncomeCategoryDto>(result));
    }

    [HttpDelete]
    [Route("[action]/{id}")]
    public async Task<IActionResult> DeleteExpenseCategory(int id)
    {
        await expenseCatagoryService.DeleteExpenseCategory(id);
        return Ok(true);
    }
}
