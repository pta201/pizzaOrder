using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore.SqlServer;
using BackendAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
        builder =>
        {
            builder.WithOrigins("https://localhost:44351", "http://localhost:4200", "http://localhost:3000")
                                .AllowAnyHeader()
                                .AllowAnyMethod();
        });
});
builder.Services.AddMvc(options => options.EnableEndpointRouting = false)
                .SetCompatibilityVersion(CompatibilityVersion.Version_3_0)
                .AddNewtonsoftJson(opt => opt.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);
builder.Services.AddControllers();

var connectionString = builder.Configuration.GetConnectionString("Pizza");
builder.Services.AddDbContext<PizzaContext>(x => x.UseSqlServer(connectionString));

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

app.UseCors(builder =>
{
    builder
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader();
});

app.Run();
