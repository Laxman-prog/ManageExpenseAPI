using AutoMapper;
using Expense.Manager.API.Dtos;
using Expense.Manager.Application.IServices;
using Microsoft.AspNetCore.Mvc;

namespace Expense.Manager.API.Controllers;

public class UserController : ExpenseBaseController
{
    private readonly IUserService userService;
    private readonly IMapper mapper;
    public UserController(IUserService userService, IMapper mapper)
    {
        this.userService = userService;
        this.mapper = mapper;
    }
  
    [HttpGet]
    [Route("[action]")]
    public async Task<IActionResult> GetAllUsers()
    {
        var users = await userService.GetAllUsers();
        var userDtos = mapper.Map<IReadOnlyList<UserDto>>(users);
        return Ok(userDtos);
    }
}
