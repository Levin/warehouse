defmodule Warehouse.Exhibits.Exhibit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exhibits" do
    field :length, :float
    field :description, :string
    field :title, :string
    field :width, :float
    field :materials, :string
    field :height, :float
    field :created, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(exhibit, attrs) do
    exhibit
    |> cast(attrs, [:title, :description, :materials, :height, :width, :length, :created, :price])
    |> validate_required([:title, :description, :materials, :height, :width, :length, :created, :price])
  end
end
