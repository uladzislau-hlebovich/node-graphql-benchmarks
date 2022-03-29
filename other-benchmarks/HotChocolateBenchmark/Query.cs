namespace HotChocolateBenchmark;

public class Query
{
    public Author[] GetAuthors()
    {
        return Enumerable
            .Range(1, 20)
            .Select(i => new Author
            {
                Id = $"{i}",
                Name = $"Author {i}",
                Company = "Company",
                Books = Enumerable
                    .Range(1, 3)
                    .Select(j => new Book
                    {
                        Id = $"{j}",
                        Name = $"Book {i}.{j}",
                        NumPages = j * 100 * i
                    })
                    .ToArray()
            }).ToArray();
    }
}