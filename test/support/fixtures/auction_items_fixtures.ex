defmodule Warehouse.AuctionItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Warehouse.AuctionItems` context.
  """

  @doc """
  Generate a auction_item.
  """
  def auction_item_fixture(attrs \\ %{}) do
    {:ok, auction_item} =
      attrs
      |> Enum.into(%{
        auction_id: 42,
        exhibit_id: 42
      })
      |> Warehouse.AuctionItems.create_auction_item()

    auction_item
  end
end
