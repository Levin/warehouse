defmodule Warehouse.Artists.Artist do
  alias Warehouse.Auctions.Auction
  alias Warehouse.Exhibits.Exhibit
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :name, :string
    field :description, :string
    field :location, :string
    field :mail, :string
    field :age, :integer
    field :phone, :string
    field :projects, :string

    has_many :exhibits, Exhibit, on_replace: :mark_as_invalid
    belongs_to :auctions, Auction, on_replace:  :mark_as_invalid

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :age, :description, :mail, :phone, :location, :projects])
    |> validate_required([:name, :age, :description])
  end
end
