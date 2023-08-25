defmodule WarehouseWeb.ExhibitController do
  use WarehouseWeb, :controller

  alias Warehouse.Exhibits
  alias Warehouse.Exhibits.Exhibit

  def index(conn, _params) do
    exhibits = Exhibits.list_exhibits()
    render(conn, :index, exhibits: exhibits)
  end

  def new(conn, _params) do
    changeset = Exhibits.change_exhibit(%Exhibit{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"exhibit" => exhibit_params}) do
    case Exhibits.create_exhibit(exhibit_params) do
      {:ok, exhibit} ->
        conn
        |> put_flash(:info, "Exhibit created successfully.")
        |> redirect(to: ~p"/exhibits/#{exhibit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exhibit = Exhibits.get_exhibit!(id)
    render(conn, :show, exhibit: exhibit)
  end

  def edit(conn, %{"id" => id}) do
    exhibit = Exhibits.get_exhibit!(id)
    changeset = Exhibits.change_exhibit(exhibit)
    render(conn, :edit, exhibit: exhibit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "exhibit" => exhibit_params}) do
    exhibit = Exhibits.get_exhibit!(id)

    case Exhibits.update_exhibit(exhibit, exhibit_params) do
      {:ok, exhibit} ->
        conn
        |> put_flash(:info, "Exhibit updated successfully.")
        |> redirect(to: ~p"/exhibits/#{exhibit}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, exhibit: exhibit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    exhibit = Exhibits.get_exhibit!(id)
    {:ok, _exhibit} = Exhibits.delete_exhibit(exhibit)

    conn
    |> put_flash(:info, "Exhibit deleted successfully.")
    |> redirect(to: ~p"/exhibits")
  end
end
