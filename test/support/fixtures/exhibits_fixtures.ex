defmodule Warehouse.ExhibitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Warehouse.Exhibits` context.
  """

  @doc """
  Generate a exhibit.
  """
  def exhibit_fixture(attrs \\ %{}) do
    {:ok, exhibit} =
      attrs
      |> Enum.into(%{
        length: 42,
        description: "some description",
        title: "some title",
        width: 42,
        materials: "some materials",
        height: 42,
        created: "some created",
        costs: 120.5
      })
      |> Warehouse.Exhibits.create_exhibit()

    exhibit
  end
end
