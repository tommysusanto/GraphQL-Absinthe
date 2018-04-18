defmodule Graphqlabsinthe.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :order_id, :string
    field :total_cost, :float
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_id, :total_cost])
    |> validate_required([:order_id, :total_cost])
  end
end
