defmodule Warehouse.AuctionsTest do
  use Warehouse.DataCase

  alias Warehouse.Auctions

  describe "auctions" do
    alias Warehouse.Auctions.Auction

    import Warehouse.AuctionsFixtures

    @invalid_attrs %{description: nil, title: nil, location: nil, institution: nil, theme: nil, duration: nil}

    test "list_auctions/0 returns all auctions" do
      auction = auction_fixture()
      assert Auctions.list_auctions() == [auction]
    end

    test "get_auction!/1 returns the auction with given id" do
      auction = auction_fixture()
      assert Auctions.get_auction!(auction.id) == auction
    end

    test "create_auction/1 with valid data creates a auction" do
      valid_attrs = %{description: "some description", title: "some title", location: "some location", institution: "some institution", theme: "some theme", duration: "some duration"}

      assert {:ok, %Auction{} = auction} = Auctions.create_auction(valid_attrs)
      assert auction.description == "some description"
      assert auction.title == "some title"
      assert auction.location == "some location"
      assert auction.institution == "some institution"
      assert auction.theme == "some theme"
      assert auction.duration == "some duration"
    end

    test "create_auction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auctions.create_auction(@invalid_attrs)
    end

    test "update_auction/2 with valid data updates the auction" do
      auction = auction_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", location: "some updated location", institution: "some updated institution", theme: "some updated theme", duration: "some updated duration"}

      assert {:ok, %Auction{} = auction} = Auctions.update_auction(auction, update_attrs)
      assert auction.description == "some updated description"
      assert auction.title == "some updated title"
      assert auction.location == "some updated location"
      assert auction.institution == "some updated institution"
      assert auction.theme == "some updated theme"
      assert auction.duration == "some updated duration"
    end

    test "update_auction/2 with invalid data returns error changeset" do
      auction = auction_fixture()
      assert {:error, %Ecto.Changeset{}} = Auctions.update_auction(auction, @invalid_attrs)
      assert auction == Auctions.get_auction!(auction.id)
    end

    test "delete_auction/1 deletes the auction" do
      auction = auction_fixture()
      assert {:ok, %Auction{}} = Auctions.delete_auction(auction)
      assert_raise Ecto.NoResultsError, fn -> Auctions.get_auction!(auction.id) end
    end

    test "change_auction/1 returns a auction changeset" do
      auction = auction_fixture()
      assert %Ecto.Changeset{} = Auctions.change_auction(auction)
    end
  end
end
