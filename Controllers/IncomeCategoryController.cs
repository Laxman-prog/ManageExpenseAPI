using AutoMapper;
using Expense.Manager.API.Dtos;
using Expense.Manager.Application.IServices;
using Expense.Manager.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Expense.Manager.API.Controllers;

public class IncomeCategoryController : ExpenseBaseController
{
    private readonly IIncomeCategoryService incomeCatagoryService;
    private readonly IMapper mapper;
    public IncomeCategoryController(IIncomeCategoryService incomeCatagoryService, IMapper mapper)
    {
        this.mapper = mapper;
        this.incomeCatagoryService = incomeCatagoryService;
    }

    [HttpGet]
    [Route("[action]")]
    public async Task<IActionResult> GetAllIncomeCategories()
    {
        var result = await incomeCatagoryService.GetExpenseCategories();
        return Ok(mapper.Map<IReadOnlyList<IncomeCategoryDto>>(result));
    }

    [HttpPost]
    [Route("[action]")]
    public async Task<IActionResult> UpsertIncomeCategory([FromBody] IncomeCategoryDto incomeCategoryDto)
    {
        var expense = mapper.Map<IncomeCategory>(incomeCategoryDto);
        var result = await incomeCatagoryService.UpsertExpenseCategory(expense);
        return Ok(mapper.Map<IncomeCategoryDto>(result));
    }

    [HttpDelete]
    [Route("[action]/{id}")]
    public async Task<IActionResult> DeleteIncomeCategory(int id)
    {
        await incomeCatagoryService.DeleteExpenseCategory(id);
        return Ok(true);
    }
}
