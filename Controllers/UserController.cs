using Expense.Manager.Application.IServices;
using Microsoft.AspNetCore.Mvc;

namespace Expense.Manager.API.Controllers;

public class UserController : ExpenseBaseController
{
    private readonly IUserService userService;
    public UserController(IUserService userService)
    {
        this.userService = userService;
    }
  
    [HttpGet]
    [Route("[action]")]
    public async Task<IActionResult> GetAllUsers()
    {
        var users = await userService.GetAllUsers();
        return Ok(users);
    }
}
