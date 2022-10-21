using KarkaThamizha.API.Configuration;
using KarkaThamizha.Interfaces.IRepository;
using KarkaThamizha.Interfaces.IService;
using KarkaThamizha.Interfaces.SQLObjects;
using KarkaThamizha.Repository.Repository;
using KarkaThamizha.Repository.SQLObjects;
using KarkaThamizha.Services.Services;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);

//builder.Services.Configure<SQLDBConfiguration>(builder.Configuration.GetSection("SQLDBConfiguration"));
//var connectionString = builder.Configuration.GetConnectionString("KarkaConnection");
//builder.Services.AddDbContextPool(option =>
//    option.UseSqlServer());

//builder.Services.AddDBConnections(builder.Configuration);

// Add services to the container.
//builder.Services.AddScoped<IConnectionFactory, ConnectionFactory>();
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IAccountRepository, AccountRepository>();


builder.Services.AddControllers();
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
