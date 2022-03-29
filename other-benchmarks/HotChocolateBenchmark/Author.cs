namespace HotChocolateBenchmark;

public class Author
{
    public string Id { get; set; }

    public string Name { get; set; }
    
    public string Md5 { get; set; }

    public string Company { get; set; }

    public Book[] Books { get; set; }
}

public class AuthorType : ObjectType<Author>
{
    protected override void Configure(IObjectTypeDescriptor<Author> descriptor)
    {
        descriptor.Field(t => t.Id)
            .Type<NonNullType<IdType>>();
        
        descriptor.Field(t => t.Name)
            .Type<NonNullType<StringType>>();
        
        descriptor.Field(t => t.Md5)
            .Type<NonNullType<StringType>>()
            .Resolve(ctx => Md5Service.Hash(ctx.Parent<Author>().Name));

        descriptor.Field(t => t.Company)
            .Type<NonNullType<StringType>>();
        
        descriptor.Field(t => t.Books)
            .Type<ListType<NonNullType<BookType>>>();
    }
}