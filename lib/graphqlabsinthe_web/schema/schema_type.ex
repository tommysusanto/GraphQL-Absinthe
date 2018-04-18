defmodule GraphqlabsintheWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Graphqlabsinthe.Repo

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :home_address, :string

    field :friends, list_of(:user), resolve: assoc(:friends)
    
    query do
      field :all_users, non_null(list_of(non_null(:user)))
    end
  end
end