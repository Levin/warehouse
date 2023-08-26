defmodule WarehouseWeb.AuctionController do
  use WarehouseWeb, :controller

  alias Warehouse.Auctions
  alias Warehouse.Auctions.Auction
  alias Warehouse.AuctionItems.AuctionItem

  def index(conn, _params) do
    auctions = Auctions.list_auctions()
    render(conn, :index, auctions: auctions)
  end

  def new(conn, _params) do
    changeset = Auctions.change_auction(%Auction{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"auction" => auction_params}) do
    case Auctions.create_auction(auction_params) do
      {:ok, auction} ->
        conn
        |> put_flash(:info, "Auction created successfully.")
        |> redirect(to: ~p"/auctions/#{auction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    auction = Auctions.get_auction!(id)
    exhibits = AuctionItem.map_auction_to_item(id)
    render(conn, :show, auction: auction, exhibits: exhibits)
  end

  def edit(conn, %{"id" => id}) do
    auction = Auctions.get_auction!(id)
    changeset = Auctions.change_auction(auction)
    render(conn, :edit, auction: auction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "auction" => auction_params}) do
    auction = Auctions.get_auction!(id)

    case Auctions.update_auction(auction, auction_params) do
      {:ok, auction} ->
        conn
        |> put_flash(:info, "Auction updated successfully.")
        |> redirect(to: ~p"/auctions/#{auction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, auction: auction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    auction = Auctions.get_auction!(id)
    {:ok, _auction} = Auctions.delete_auction(auction)

    conn
    |> put_flash(:info, "Auction deleted successfully.")
    |> redirect(to: ~p"/auctions")
  end
end
