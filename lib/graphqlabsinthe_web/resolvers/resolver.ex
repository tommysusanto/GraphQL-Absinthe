defmodule GraphqlabsintheWeb.UserResolver do
  alias Graphqlabsinthe.Repo

  def all(_args, _info) do
    {:ok, Repo.all(Graphqlabsinthe.Accounts.User)}
  end
  def find_user(_parent, %{id: id}, _resolution) do
    case Repo.get(Graphqlabsinthe.Accounts.User, id) do
      nil ->
        {:error, "User ID #{id} not found"}
      user ->
        {:ok, user}
    end
  end
end