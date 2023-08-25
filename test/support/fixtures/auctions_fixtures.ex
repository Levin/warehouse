defmodule Warehouse.AuctionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Warehouse.Auctions` context.
  """

  @doc """
  Generate a auction.
  """
  def auction_fixture(attrs \\ %{}) do
    {:ok, auction} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title",
        location: "some location",
        institution: "some institution",
        theme: "some theme",
        duration: "some duration"
      })
      |> Warehouse.Auctions.create_auction()

    auction
  end
end
