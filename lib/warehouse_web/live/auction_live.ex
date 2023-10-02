defmodule WarehouseWeb.AuctionLive do
  use WarehouseWeb, :live_view
  alias Warehouse.Auctions.Auction


  def mount(_params, _session, socket) do
    auctions = Auction.prepared_auctions
    {:ok, assign(socket, auctions: auctions)}
  end

  def update(socket) do
  end


  def render(assigns) do
    ~H"""
    <div class="">
      <.header>Auctions</.header>
      <.button>New Auction</.button>
    </div>

       

    """
  end

end
