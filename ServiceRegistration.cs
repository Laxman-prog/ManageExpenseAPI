using Expense.Manager.API.Helpers;
using Expense.Manager.Infrastructure;
using Expense.Manager.Application;

namespace Expense.Manager.API;

public static class ServiceRegistration
{
    public static void RegisterServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddAutoMapper(typeof(MappingProfiles));
        services.RegisterInfraServices(configuration);
        services.RegisterAppServices();
    }
}
