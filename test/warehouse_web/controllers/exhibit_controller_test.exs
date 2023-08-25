defmodule WarehouseWeb.ExhibitControllerTest do
  use WarehouseWeb.ConnCase

  import Warehouse.ExhibitsFixtures

  @create_attrs %{length: 120.5, description: "some description", title: "some title", width: 120.5, materials: "some materials", height: 120.5, created: "some created", price: 120.5}
  @update_attrs %{length: 456.7, description: "some updated description", title: "some updated title", width: 456.7, materials: "some updated materials", height: 456.7, created: "some updated created", price: 456.7}
  @invalid_attrs %{length: nil, description: nil, title: nil, width: nil, materials: nil, height: nil, created: nil, price: nil}

  describe "index" do
    test "lists all exhibits", %{conn: conn} do
      conn = get(conn, ~p"/exhibits")
      assert html_response(conn, 200) =~ "Listing Exhibits"
    end
  end

  describe "new exhibit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/exhibits/new")
      assert html_response(conn, 200) =~ "New Exhibit"
    end
  end

  describe "create exhibit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/exhibits", exhibit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/exhibits/#{id}"

      conn = get(conn, ~p"/exhibits/#{id}")
      assert html_response(conn, 200) =~ "Exhibit #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/exhibits", exhibit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Exhibit"
    end
  end

  describe "edit exhibit" do
    setup [:create_exhibit]

    test "renders form for editing chosen exhibit", %{conn: conn, exhibit: exhibit} do
      conn = get(conn, ~p"/exhibits/#{exhibit}/edit")
      assert html_response(conn, 200) =~ "Edit Exhibit"
    end
  end

  describe "update exhibit" do
    setup [:create_exhibit]

    test "redirects when data is valid", %{conn: conn, exhibit: exhibit} do
      conn = put(conn, ~p"/exhibits/#{exhibit}", exhibit: @update_attrs)
      assert redirected_to(conn) == ~p"/exhibits/#{exhibit}"

      conn = get(conn, ~p"/exhibits/#{exhibit}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, exhibit: exhibit} do
      conn = put(conn, ~p"/exhibits/#{exhibit}", exhibit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Exhibit"
    end
  end

  describe "delete exhibit" do
    setup [:create_exhibit]

    test "deletes chosen exhibit", %{conn: conn, exhibit: exhibit} do
      conn = delete(conn, ~p"/exhibits/#{exhibit}")
      assert redirected_to(conn) == ~p"/exhibits"

      assert_error_sent 404, fn ->
        get(conn, ~p"/exhibits/#{exhibit}")
      end
    end
  end

  defp create_exhibit(_) do
    exhibit = exhibit_fixture()
    %{exhibit: exhibit}
  end
end
