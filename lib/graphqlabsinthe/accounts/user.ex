defmodule Graphqlabsinthe.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :home_address, :string
    field :name, :string
    has_one :friends, Graphqlabsinthe.Accounts.User, foreign_key: :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :home_address, :email])
    |> validate_required([:name, :home_address, :email])
  end
end
