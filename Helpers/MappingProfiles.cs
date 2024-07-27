using AutoMapper;
using Expense.Manager.API.Dtos;

namespace Expense.Manager.API.Helpers;

public class MappingProfiles : Profile
{
    public MappingProfiles() 
    {
        CreateMap<UserDto, UserDto>().ReverseMap();
    }
}
