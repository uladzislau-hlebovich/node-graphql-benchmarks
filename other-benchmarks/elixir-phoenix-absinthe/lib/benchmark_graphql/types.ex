defmodule BenchmarkGraphQL.Types do
  use Absinthe.Schema.Notation

  object :author do
    field(:id, non_null(:id))
    field(:name, non_null(:string))

    field :md5, non_null(:string) do
      resolve(fn %{name: name}, _, _ ->
        {
          :ok,
          :crypto.hash(:md5, name)
          |> Base.encode16()
          |> String.downcase()
        }
      end)
    end

    field(:company, non_null(:string))
    field(:books, list_of(:book))
  end

  object :book do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:num_pages, non_null(:integer))
  end
end
