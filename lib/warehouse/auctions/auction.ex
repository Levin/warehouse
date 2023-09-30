defmodule Warehouse.Auctions.Auction do
  alias Warehouse.Artists.Artist
  alias Warehouse.Exhibits.Exhibit
  use Ecto.Schema
  import Ecto.Changeset

  schema "auctions" do
    field :description, :string
    field :title, :string
    field :location, :string
    field :institution, :string
    field :theme, :string
    field :duration, :string

    has_many :exhibits, Exhibit, on_replace: :nilify
    has_many :artists, Artist, on_replace: :nilify

    timestamps()
  end

  @doc false
  def changeset(auction, attrs) do
    auction
    |> cast(attrs, [:title, :description, :institution, :location, :theme, :duration])
    |> validate_required([:title, :description])
  end
end
