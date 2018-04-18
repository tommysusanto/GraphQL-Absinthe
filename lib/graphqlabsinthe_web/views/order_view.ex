defmodule GraphqlabsintheWeb.OrderView do
  use GraphqlabsintheWeb, :view
  alias GraphqlabsintheWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      order_id: order.order_id,
      total_cost: order.total_cost}
  end
end
