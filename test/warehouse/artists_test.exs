defmodule Warehouse.ArtistsTest do
  use Warehouse.DataCase

  alias Warehouse.Artists

  describe "artists" do
    alias Warehouse.Artists.Artist

    import Warehouse.ArtistsFixtures

    @invalid_attrs %{name: nil, description: nil, location: nil, mail: nil, age: nil, phone: nil, projects: nil}

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Artists.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Artists.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      valid_attrs = %{name: "some name", description: "some description", location: "some location", mail: "some mail", age: 42, phone: "some phone", projects: "some projects"}

      assert {:ok, %Artist{} = artist} = Artists.create_artist(valid_attrs)
      assert artist.name == "some name"
      assert artist.description == "some description"
      assert artist.location == "some location"
      assert artist.mail == "some mail"
      assert artist.age == 42
      assert artist.phone == "some phone"
      assert artist.projects == "some projects"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Artists.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", location: "some updated location", mail: "some updated mail", age: 43, phone: "some updated phone", projects: "some updated projects"}

      assert {:ok, %Artist{} = artist} = Artists.update_artist(artist, update_attrs)
      assert artist.name == "some updated name"
      assert artist.description == "some updated description"
      assert artist.location == "some updated location"
      assert artist.mail == "some updated mail"
      assert artist.age == 43
      assert artist.phone == "some updated phone"
      assert artist.projects == "some updated projects"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Artists.update_artist(artist, @invalid_attrs)
      assert artist == Artists.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Artists.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Artists.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Artists.change_artist(artist)
    end
  end
end
