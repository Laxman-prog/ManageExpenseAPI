using Expense.Manager.API;
namespace ManageExpenseAPI;


public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        builder.WebHost.ConfigureAppConfiguration((context, config) =>
        {
            var env = context.HostingEnvironment.EnvironmentName;
            config.AddJsonFile("appsettings.json");
            if(env != "Dev")
            {
                config.AddJsonFile($"appsettings.{env}.json", optional: true);
            }
            config.Build();
        });
        // Add services to the container.

        builder.Services.AddControllers();
        builder.Services.RegisterServices(builder.Configuration);
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();


        app.MapControllers();

        app.Run();
    }
}