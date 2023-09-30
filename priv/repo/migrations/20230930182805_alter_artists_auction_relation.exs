defmodule Warehouse.Repo.Migrations.AlterArtistsAuctionRelation do
  use Ecto.Migration

  def change do

    alter table(:artists) do
      add :auction_id, references(:auctions, type: :integer, on_delete: :delete_all), null: true
    end

  end
end
