defmodule Warehouse.Repo.Migrations.CreateAuctionitems do
  use Ecto.Migration

  def change do
    create table(:auctionitems) do
      add :auction_id, :integer
      add :exhibit_id, :integer

      timestamps()
    end
  end
end
