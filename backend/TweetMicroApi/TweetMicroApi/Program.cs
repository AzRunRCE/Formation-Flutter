using TweetMicroApi.Models;
using TweetMicroApi.Repositories.MicroApi.Repositories;
using TweetMicroApi.Repositories;
using Microsoft.AspNetCore.Authentication;
using TweetMicroApi;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;

var builder = WebApplication.CreateBuilder(args);

// Ajouter les dépôts en tant que services
builder.Services.AddScoped<TweetRepository>();
builder.Services.AddScoped<UserRepository>();

// Ajouter Swagger pour la documentation de l'API
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
// Configurer l'authentification
builder.Services.AddAuthentication("BasicAuthentication")
    .AddScheme<AuthenticationSchemeOptions, BasicAuthenticationHandler>("BasicAuthentication", null);

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder =>
        {
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
        });

});
builder.Services.AddAuthorization();

var app = builder.Build();
app.UseCors("AllowAll");

app.UseAuthentication();
app.UseAuthorization();
// Configurer Swagger
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}



//app.UseHttpsRedirection();

// Endpoints pour les Tweets

app.MapGet("/tweets", async (TweetRepository repository) =>
{
    return Results.Ok(await repository.GetAllAsync());
})
.WithName("GetTweets")
.Produces<List<Tweet>>(StatusCodes.Status200OK)
.RequireAuthorization();

app.MapGet("/tweets/{id}", async (int id, TweetRepository repository) =>
{
    var tweet = await repository.GetByIdAsync(id);
    return tweet != null ? Results.Ok(tweet) : Results.NotFound();
})
.WithName("GetTweet")
.Produces<Tweet>(StatusCodes.Status200OK)
.Produces(StatusCodes.Status404NotFound)
.RequireAuthorization();

app.MapPost("/tweets", async (HttpContext httpContext, Tweet tweet, TweetRepository repository) =>
{
    tweet.Timestamp = DateTime.Now;
    await repository.AddAsync(tweet, httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier));
    return Results.Created($"/tweets/{tweet.Id}", tweet);
})
.WithName("CreateTweet")
.Produces<Tweet>(StatusCodes.Status201Created)
.RequireAuthorization();

app.MapPut("/tweets/{id}", async (int id, Tweet updatedTweet, TweetRepository repository) =>
{
    var tweet = await repository.GetByIdAsync(id);
    if (tweet == null)
    {
        return Results.NotFound();
    }

    updatedTweet.Id = tweet.Id;
    await repository.UpdateAsync(updatedTweet);
    return Results.NoContent();
})
.WithName("UpdateTweet")
.Produces(StatusCodes.Status204NoContent)
.Produces(StatusCodes.Status404NotFound)
.RequireAuthorization();

app.MapDelete("/tweets/{id}", async (HttpContext httpContext, int id, TweetRepository repository) =>
{
    var tweet = await repository.GetByIdAsync(id);
    if (tweet == null)
    {
        return Results.NotFound();
    }
    if (tweet.Username != httpContext.User.FindFirstValue(ClaimTypes.NameIdentifier))
        throw new UnauthorizedAccessException("Vous n'etes pas le propriétaire du Tweet!");
    await repository.DeleteAsync(id);
    return Results.NoContent();
})
.WithName("DeleteTweet")
.Produces(StatusCodes.Status204NoContent)
.Produces(StatusCodes.Status404NotFound)
.RequireAuthorization();

app.MapGet("/users", async (UserRepository repository) =>
{
    return Results.Ok(await repository.GetAllAsync());
})
.WithName("GetUsers")
.Produces<List<User>>(StatusCodes.Status200OK)
.RequireAuthorization();

//app.MapGet("/users/{id}", async (int id, IRepository<User> repository) =>
//{
//    var user = await repository.GetByIdAsync(id);
//    return user != null ? Results.Ok(user) : Results.NotFound();
//})
//.WithName("GetUser")
//.Produces<User>(StatusCodes.Status200OK)
//.Produces(StatusCodes.Status404NotFound);

app.MapPost("/users", async (User user, UserRepository repository) =>
{
    var userBdd = await repository.GetByUsernameAsync(user.Username);
    if (userBdd != null)
    {
        return Results.BadRequest("Username already taken");
    }
    await repository.AddAsync(user);
    return Results.Created($"/users/{user.Id}", user);
})
.WithName("CreateUser")
.Produces<User>(StatusCodes.Status201Created)
.RequireAuthorization();

app.MapPut("/users/{id}", async (int id, User updatedUser, UserRepository repository) =>
{
    var user = await repository.GetByIdAsync(id);
    if (user == null)
    {
        return Results.NotFound();
    }

    updatedUser.Id = user.Id;
    await repository.UpdateAsync(updatedUser);
    return Results.NoContent();
})
.WithName("UpdateUser")
.Produces(StatusCodes.Status204NoContent)
.Produces(StatusCodes.Status404NotFound)
.RequireAuthorization();

//app.MapDelete("/users/{id}", async (int id, IRepository<User> repository) =>
//{
//    var user = await repository.GetByIdAsync(id);
//    if (user == null)
//    {
//        return Results.NotFound();
//    }

//    await repository.DeleteAsync(id);
//    return Results.NoContent();
//})
//.WithName("DeleteUser")
//.Produces(StatusCodes.Status204NoContent)
//.Produces(StatusCodes.Status404NotFound);

app.Run("http://+:3001");
