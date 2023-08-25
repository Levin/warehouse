defmodule Warehouse.ArtistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Warehouse.Artists` context.
  """

  @doc """
  Generate a artist.
  """
  def artist_fixture(attrs \\ %{}) do
    {:ok, artist} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        location: "some location",
        mail: "some mail",
        age: 42,
        phone: "some phone",
        projects: "some projects"
      })
      |> Warehouse.Artists.create_artist()

    artist
  end
end
