defmodule Warehouse.Repo.Migrations.CreateExhibits do
  use Ecto.Migration

  def change do
    create table(:exhibits) do
      add :title, :string
      add :description, :string
      add :materials, :string
      add :height, :float
      add :width, :float
      add :length, :float
      add :created, :string
      add :price, :float

      timestamps()
    end
  end
end
