defmodule Warehouse.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :age, :integer
      add :description, :string
      add :mail, :string
      add :phone, :string
      add :location, :string
      add :projects, :string



      timestamps()
    end
  end
end
