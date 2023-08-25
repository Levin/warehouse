defmodule Warehouse.Exhibits.Exhibit do
  use Ecto.Schema
  import Ecto.Changeset
  alias Warehouse.Exhibits

  schema "exhibits" do
    field :length, :integer
    field :description, :string
    field :title, :string
    field :width, :integer
    field :materials, :string
    field :height, :integer
    field :created, :string
    field :costs, :float

    timestamps()
  end

  @doc false
  def changeset(exhibit, attrs) do
    exhibit
    |> cast(attrs, [:title, :description, :materials, :height, :width, :length, :created, :costs])
    |> validate_required([:title, :description, :materials, :height, :width, :length, :created, :costs])
  end

  def prepared_exhibits() do
    exhibits = Exhibits.list_exhibits
    exhibits 
    |> Enum.map(fn %Warehouse.Exhibits.Exhibit{} = item -> %{id: item.id, title: item.title, description: item.description, materials: item.materials, height: item.height, width: item.width, length: item.length, created: item.created, costs: item.costs} end)
  end


end
