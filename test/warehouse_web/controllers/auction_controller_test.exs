defmodule WarehouseWeb.AuctionControllerTest do
  use WarehouseWeb.ConnCase

  import Warehouse.AuctionsFixtures

  @create_attrs %{description: "some description", title: "some title", location: "some location", institution: "some institution", theme: "some theme", duration: "some duration"}
  @update_attrs %{description: "some updated description", title: "some updated title", location: "some updated location", institution: "some updated institution", theme: "some updated theme", duration: "some updated duration"}
  @invalid_attrs %{description: nil, title: nil, location: nil, institution: nil, theme: nil, duration: nil}

  describe "index" do
    test "lists all auctions", %{conn: conn} do
      conn = get(conn, ~p"/auctions")
      assert html_response(conn, 200) =~ "Listing Auctions"
    end
  end

  describe "new auction" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/auctions/new")
      assert html_response(conn, 200) =~ "New Auction"
    end
  end

  describe "create auction" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/auctions", auction: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/auctions/#{id}"

      conn = get(conn, ~p"/auctions/#{id}")
      assert html_response(conn, 200) =~ "Auction #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/auctions", auction: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Auction"
    end
  end

  describe "edit auction" do
    setup [:create_auction]

    test "renders form for editing chosen auction", %{conn: conn, auction: auction} do
      conn = get(conn, ~p"/auctions/#{auction}/edit")
      assert html_response(conn, 200) =~ "Edit Auction"
    end
  end

  describe "update auction" do
    setup [:create_auction]

    test "redirects when data is valid", %{conn: conn, auction: auction} do
      conn = put(conn, ~p"/auctions/#{auction}", auction: @update_attrs)
      assert redirected_to(conn) == ~p"/auctions/#{auction}"

      conn = get(conn, ~p"/auctions/#{auction}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, auction: auction} do
      conn = put(conn, ~p"/auctions/#{auction}", auction: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Auction"
    end
  end

  describe "delete auction" do
    setup [:create_auction]

    test "deletes chosen auction", %{conn: conn, auction: auction} do
      conn = delete(conn, ~p"/auctions/#{auction}")
      assert redirected_to(conn) == ~p"/auctions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/auctions/#{auction}")
      end
    end
  end

  defp create_auction(_) do
    auction = auction_fixture()
    %{auction: auction}
  end
end
