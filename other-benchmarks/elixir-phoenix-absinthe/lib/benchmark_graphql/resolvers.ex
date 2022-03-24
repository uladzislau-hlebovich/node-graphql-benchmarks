defmodule BenchmarkGraphQL.Resolvers do
  def list_authors(_parent, _args, _resolution) do
    authors =
      Enum.map(1..20, fn _ ->
        books =
          Enum.map(1..3, fn _ ->
            %{
              id: Faker.UUID.v4(),
              name: Faker.Internet.domain_name(),
              num_pages: Faker.Random.Elixir.random_between(1, 200)
            }
          end)

        %{
          id: Faker.UUID.v4(),
          name: Faker.Person.name(),
          company: Faker.Company.bs(),
          books: books
        }
      end)

    {:ok, authors}
  end
end
