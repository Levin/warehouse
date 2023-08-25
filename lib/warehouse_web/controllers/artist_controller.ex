defmodule WarehouseWeb.ArtistController do
  use WarehouseWeb, :controller

  alias Warehouse.Artists
  alias Warehouse.Artists.Artist

  def index(conn, _params) do
    artists = Artists.list_artists()
    render(conn, :index, artists: artists)
  end

  def new(conn, _params) do
    changeset = Artists.change_artist(%Artist{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"artist" => artist_params}) do
    case Artists.create_artist(artist_params) do
      {:ok, artist} ->
        conn
        |> put_flash(:info, "Artist created successfully.")
        |> redirect(to: ~p"/artists/#{artist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist = Artists.get_artist!(id)
    render(conn, :show, artist: artist)
  end

  def edit(conn, %{"id" => id}) do
    artist = Artists.get_artist!(id)
    changeset = Artists.change_artist(artist)
    render(conn, :edit, artist: artist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artist" => artist_params}) do
    artist = Artists.get_artist!(id)

    case Artists.update_artist(artist, artist_params) do
      {:ok, artist} ->
        conn
        |> put_flash(:info, "Artist updated successfully.")
        |> redirect(to: ~p"/artists/#{artist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, artist: artist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Artists.get_artist!(id)
    {:ok, _artist} = Artists.delete_artist(artist)

    conn
    |> put_flash(:info, "Artist deleted successfully.")
    |> redirect(to: ~p"/artists")
  end
end
