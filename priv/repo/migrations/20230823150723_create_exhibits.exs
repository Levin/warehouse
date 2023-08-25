defmodule Warehouse.Repo.Migrations.CreateExhibits do
  use Ecto.Migration

  def change do
    create table(:exhibits) do
      add :title, :string
      add :description, :string
      add :materials, :string
      add :height, :integer
      add :width, :integer
      add :length, :integer
      add :created, :string
      add :costs, :float

      timestamps()
    end
  end
end
