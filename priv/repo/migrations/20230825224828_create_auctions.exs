defmodule Warehouse.Repo.Migrations.CreateAuctions do
  use Ecto.Migration

  def change do
    create table(:auctions) do
      add :title, :string
      add :description, :string
      add :institution, :string
      add :location, :string
      add :theme, :string
      add :duration, :string

      timestamps()
    end
  end
end
