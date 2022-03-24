defmodule BenchmarkGraphQL.Schema do
  use Absinthe.Schema

  import_types(BenchmarkGraphQL.Types)

  alias BenchmarkGraphQL.Resolvers

  query do
    field :authors, list_of(:author) do
      resolve(&BenchmarkGraphQL.Resolvers.list_authors/3)
    end
  end
end
