namespace HotChocolateBenchmark;

public class Book
{
    public string Id { get; set; }

    public string Name { get; set; }

    public int NumPages { get; set; }
}

public class BookType: ObjectType<Book>
{
    protected override void Configure(IObjectTypeDescriptor<Book> descriptor)
    {
        descriptor.Field(t => t.Id).Type<NonNullType<IdType>>();
        descriptor.Field(t => t.Name).Type<NonNullType<StringType>>();
        descriptor.Field(t => t.NumPages).Type<NonNullType<IntType>>();
    }
}