using HotChocolateBenchmark;

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddType<BookType>()
    .AddType<AuthorType>()
    .AddQueryType<Query>();


var app = builder.Build();


app.MapGraphQL("/graphql");

app.Run();