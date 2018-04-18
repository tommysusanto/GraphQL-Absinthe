defmodule GraphqlabsintheWeb.Router do
  use GraphqlabsintheWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraphqlabsintheWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

  scope "/" do
    pipe_through :api

    forward "/graph", Absinthe.Plug,
    schema: GraphqlabsintheWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GraphqlabsintheWeb.Schema
  end

  scope "/api", GraphqlabsintheWeb do
    pipe_through :api

    resources "/users", UserController
    resources "/orders", OrderController
  end
end
