defmodule Warehouse.Auctions do
  @moduledoc """
  The Auctions context.
  """

  import Ecto.Query, warn: false
  alias Warehouse.Repo

  alias Warehouse.Auctions.Auction

  @doc """
  Returns the list of auctions.

  ## Examples

      iex> list_auctions()
      [%Auction{}, ...]

  """
  def list_auctions do
    Repo.all(Auction)
  end

  @doc """
  Gets a single auction.

  Raises `Ecto.NoResultsError` if the Auction does not exist.

  ## Examples

      iex> get_auction!(123)
      %Auction{}

      iex> get_auction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_auction!(id), do: Repo.get!(Auction, id)

  @doc """
  Creates a auction.

  ## Examples

      iex> create_auction(%{field: value})
      {:ok, %Auction{}}

      iex> create_auction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_auction(attrs \\ %{}) do
    %Auction{}
    |> Auction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a auction.

  ## Examples

      iex> update_auction(auction, %{field: new_value})
      {:ok, %Auction{}}

      iex> update_auction(auction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_auction(%Auction{} = auction, attrs) do
    auction
    |> Auction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a auction.

  ## Examples

      iex> delete_auction(auction)
      {:ok, %Auction{}}

      iex> delete_auction(auction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_auction(%Auction{} = auction) do
    Repo.delete(auction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking auction changes.

  ## Examples

      iex> change_auction(auction)
      %Ecto.Changeset{data: %Auction{}}

  """
  def change_auction(%Auction{} = auction, attrs \\ %{}) do
    Auction.changeset(auction, attrs)
  end
end
