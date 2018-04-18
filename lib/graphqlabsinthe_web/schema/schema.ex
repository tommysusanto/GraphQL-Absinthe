defmodule GraphqlabsintheWeb.Schema do
  use Absinthe.Schema
  import_types GraphqlabsintheWeb.Schema.Types

  query do
    field :user, list_of(:user) do
      resolve &GraphqlabsintheWeb.UserResolver.all/2
    end
  end
end