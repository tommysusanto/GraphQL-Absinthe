defmodule GraphqlabsintheWeb.Schema do
  use Absinthe.Schema
  import_types GraphqlabsintheWeb.Schema.Types

  query do
    field :users, list_of(:user) do
      resolve &GraphqlabsintheWeb.UserResolver.all/2
    end
    field :user, :user do
      arg :id, non_null(:id)
      resolve &GraphqlabsintheWeb.UserResolver.find_user/3
    end
  end

end