defmodule Warehouse.Auctions.Auction do
  use Ecto.Schema
  import Ecto.Changeset
  alias Warehouse.Auctions
  alias Warehouse.AuctionItems.AuctionItem

  schema "auctions" do
    field :description, :string
    field :title, :string
    field :location, :string
    field :institution, :string
    field :theme, :string
    field :duration, :string

    timestamps()
  end

  @doc false
  def changeset(auction, attrs) do
    auction
    |> cast(attrs, [:title, :description, :institution, :location, :theme, :duration])
    |> validate_required([:title, :description, :institution, :location, :theme, :duration])
  end


  def prepared_auctions() do
    auctions = Auctions.list_auctions()
    items = AuctionItem.prepared_items()
    IO.inspect("items")
    IO.inspect(items)
    auctions
    |> Enum.map(fn %Warehouse.Auctions.Auction{} = auction ->  %{id: auction.id, title: auction.title, description: auction.description, institution: auction.institution,location:  auction.location, theme: auction.theme, duration: auction.duration} end)
  end

end
