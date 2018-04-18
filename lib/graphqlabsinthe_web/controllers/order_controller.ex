defmodule GraphqlabsintheWeb.OrderController do
  use GraphqlabsintheWeb, :controller

  alias Graphqlabsinthe.Sales
  alias Graphqlabsinthe.Sales.Order

  action_fallback GraphqlabsintheWeb.FallbackController

  def index(conn, _params) do
    orders = Sales.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Sales.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Sales.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Sales.get_order!(id)

    with {:ok, %Order{} = order} <- Sales.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Sales.get_order!(id)
    with {:ok, %Order{}} <- Sales.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
