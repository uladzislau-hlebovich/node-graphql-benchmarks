defmodule BenchmarkGraphQL.Resolvers do
  def list_authors(_parent, _args, _resolution) do
    authors =
      Enum.map(1..20, fn _ ->
        books =
          Enum.map(1..3, fn _ ->
            %{
              id: "123e4567-e89b-12d3-a456-426614174000",
              name: "hettinger.name",
              num_pages: 50
            }
          end)

        %{
          id: "123e4567-e89b-12d3-a456-426614174000",
          name: "Elza Hackett",
          company: "drive interactive architectures",
          books: books
        }
      end)

    {:ok, authors}
  end
end
