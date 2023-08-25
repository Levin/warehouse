defmodule Warehouse.AuctionItemsTest do
  use Warehouse.DataCase

  alias Warehouse.AuctionItems

  describe "auctionitems" do
    alias Warehouse.AuctionItems.AuctionItem

    import Warehouse.AuctionItemsFixtures

    @invalid_attrs %{auction_id: nil, exhibit_id: nil}

    test "list_auctionitems/0 returns all auctionitems" do
      auction_item = auction_item_fixture()
      assert AuctionItems.list_auctionitems() == [auction_item]
    end

    test "get_auction_item!/1 returns the auction_item with given id" do
      auction_item = auction_item_fixture()
      assert AuctionItems.get_auction_item!(auction_item.id) == auction_item
    end

    test "create_auction_item/1 with valid data creates a auction_item" do
      valid_attrs = %{auction_id: 42, exhibit_id: 42}

      assert {:ok, %AuctionItem{} = auction_item} = AuctionItems.create_auction_item(valid_attrs)
      assert auction_item.auction_id == 42
      assert auction_item.exhibit_id == 42
    end

    test "create_auction_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AuctionItems.create_auction_item(@invalid_attrs)
    end

    test "update_auction_item/2 with valid data updates the auction_item" do
      auction_item = auction_item_fixture()
      update_attrs = %{auction_id: 43, exhibit_id: 43}

      assert {:ok, %AuctionItem{} = auction_item} = AuctionItems.update_auction_item(auction_item, update_attrs)
      assert auction_item.auction_id == 43
      assert auction_item.exhibit_id == 43
    end

    test "update_auction_item/2 with invalid data returns error changeset" do
      auction_item = auction_item_fixture()
      assert {:error, %Ecto.Changeset{}} = AuctionItems.update_auction_item(auction_item, @invalid_attrs)
      assert auction_item == AuctionItems.get_auction_item!(auction_item.id)
    end

    test "delete_auction_item/1 deletes the auction_item" do
      auction_item = auction_item_fixture()
      assert {:ok, %AuctionItem{}} = AuctionItems.delete_auction_item(auction_item)
      assert_raise Ecto.NoResultsError, fn -> AuctionItems.get_auction_item!(auction_item.id) end
    end

    test "change_auction_item/1 returns a auction_item changeset" do
      auction_item = auction_item_fixture()
      assert %Ecto.Changeset{} = AuctionItems.change_auction_item(auction_item)
    end
  end
end
