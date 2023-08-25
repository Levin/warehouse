defmodule Warehouse.AuctionItems do
  @moduledoc """
  The AuctionItems context.
  """

  import Ecto.Query, warn: false
  alias Warehouse.Repo

  alias Warehouse.AuctionItems.AuctionItem

  @doc """
  Returns the list of auctionitems.

  ## Examples

      iex> list_auctionitems()
      [%AuctionItem{}, ...]

  """
  def list_auctionitems do
    Repo.all(AuctionItem)
  end

  @doc """
  Gets a single auction_item.

  Raises `Ecto.NoResultsError` if the Auction item does not exist.

  ## Examples

      iex> get_auction_item!(123)
      %AuctionItem{}

      iex> get_auction_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_auction_item!(id), do: Repo.get!(AuctionItem, id)

  @doc """
  Creates a auction_item.

  ## Examples

      iex> create_auction_item(%{field: value})
      {:ok, %AuctionItem{}}

      iex> create_auction_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_auction_item(attrs \\ %{}) do
    %AuctionItem{}
    |> AuctionItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a auction_item.

  ## Examples

      iex> update_auction_item(auction_item, %{field: new_value})
      {:ok, %AuctionItem{}}

      iex> update_auction_item(auction_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_auction_item(%AuctionItem{} = auction_item, attrs) do
    auction_item
    |> AuctionItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a auction_item.

  ## Examples

      iex> delete_auction_item(auction_item)
      {:ok, %AuctionItem{}}

      iex> delete_auction_item(auction_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_auction_item(%AuctionItem{} = auction_item) do
    Repo.delete(auction_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking auction_item changes.

  ## Examples

      iex> change_auction_item(auction_item)
      %Ecto.Changeset{data: %AuctionItem{}}

  """
  def change_auction_item(%AuctionItem{} = auction_item, attrs \\ %{}) do
    AuctionItem.changeset(auction_item, attrs)
  end
end
