defmodule GraphqlabsintheWeb.UserResolver do

  def all(_args, _info) do
    {:ok, Graphqlabsinthe.Repo.all(Graphqlabsinthe.Accounts.User)}
  end
end