defmodule BenchmarkWeb.Router do
  use BenchmarkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/", Absinthe.Plug.GraphiQL,
            schema: BenchmarkGraphQL.Schema

    forward "/query", Absinthe.Plug,
            schema: BenchmarkGraphQL.Schema
  end
end
