using AutoMapper;
using Expense.Manager.API.Dtos;
using Expense.Manager.Domain.Entities;

namespace Expense.Manager.API.Helpers;

public class MappingProfiles : Profile
{
    public MappingProfiles() 
    {
        CreateMap<UserDto, User>().ReverseMap();
        CreateMap<IncomeCategoryDto, ExpenseCategory>().ReverseMap();
        CreateMap<IncomeCategoryDto, IncomeCategory>().ReverseMap();
    }
}
