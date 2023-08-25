defmodule Warehouse.Exhibits do
  @moduledoc """
  The Exhibits context.
  """

  import Ecto.Query, warn: false
  alias Warehouse.Repo

  alias Warehouse.Exhibits.Exhibit

  @doc """
  Returns the list of exhibits.

  ## Examples

      iex> list_exhibits()
      [%Exhibit{}, ...]

  """
  def list_exhibits do
    Repo.all(Exhibit)
  end

  @doc """
  Gets a single exhibit.

  Raises `Ecto.NoResultsError` if the Exhibit does not exist.

  ## Examples

      iex> get_exhibit!(123)
      %Exhibit{}

      iex> get_exhibit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exhibit!(id), do: Repo.get!(Exhibit, id)

  @doc """
  Creates a exhibit.

  ## Examples

      iex> create_exhibit(%{field: value})
      {:ok, %Exhibit{}}

      iex> create_exhibit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exhibit(attrs \\ %{}) do
    %Exhibit{}
    |> Exhibit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exhibit.

  ## Examples

      iex> update_exhibit(exhibit, %{field: new_value})
      {:ok, %Exhibit{}}

      iex> update_exhibit(exhibit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exhibit(%Exhibit{} = exhibit, attrs) do
    exhibit
    |> Exhibit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exhibit.

  ## Examples

      iex> delete_exhibit(exhibit)
      {:ok, %Exhibit{}}

      iex> delete_exhibit(exhibit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exhibit(%Exhibit{} = exhibit) do
    Repo.delete(exhibit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exhibit changes.

  ## Examples

      iex> change_exhibit(exhibit)
      %Ecto.Changeset{data: %Exhibit{}}

  """
  def change_exhibit(%Exhibit{} = exhibit, attrs \\ %{}) do
    Exhibit.changeset(exhibit, attrs)
  end
end
