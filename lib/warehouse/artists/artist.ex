defmodule Warehouse.Artists.Artist do
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

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :age, :description, :mail, :phone, :location, :projects])
    |> validate_required([:name, :age, :description, :mail, :phone, :location, :projects])
  end
end
