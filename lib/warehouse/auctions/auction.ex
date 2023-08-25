defmodule Warehouse.Auctions.Auction do
  use Ecto.Schema
  import Ecto.Changeset

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
end
