defmodule WarehouseWeb.Live.AuctionIndex do
  use WarehouseWeb, :live_view

  alias Warehouse.Auctions

  def mount(_params, _session, socket) do
    auctions =  Auctions.list_auctions()

    {:ok, assign(socket, auctions: auctions)}
  end

  def render(assigns) do
    ~H"""
    <.header>auctions</.header>

  <%= inspect(assigns.auctions) %>

    """
  end



end


