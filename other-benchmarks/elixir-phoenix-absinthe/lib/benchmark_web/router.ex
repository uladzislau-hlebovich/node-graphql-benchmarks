defmodule BenchmarkWeb.Router do
  use BenchmarkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
            schema: BenchmarkGraphQL.Schema
  end
end
