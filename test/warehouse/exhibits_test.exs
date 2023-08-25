defmodule Warehouse.ExhibitsTest do
  use Warehouse.DataCase

  alias Warehouse.Exhibits

  describe "exhibits" do
    alias Warehouse.Exhibits.Exhibit

    import Warehouse.ExhibitsFixtures

    @invalid_attrs %{length: nil, description: nil, title: nil, width: nil, materials: nil, height: nil, created: nil, costs: nil}

    test "list_exhibits/0 returns all exhibits" do
      exhibit = exhibit_fixture()
      assert Exhibits.list_exhibits() == [exhibit]
    end

    test "get_exhibit!/1 returns the exhibit with given id" do
      exhibit = exhibit_fixture()
      assert Exhibits.get_exhibit!(exhibit.id) == exhibit
    end

    test "create_exhibit/1 with valid data creates a exhibit" do
      valid_attrs = %{length: 42, description: "some description", title: "some title", width: 42, materials: "some materials", height: 42, created: "some created", costs: 120.5}

      assert {:ok, %Exhibit{} = exhibit} = Exhibits.create_exhibit(valid_attrs)
      assert exhibit.length == 42
      assert exhibit.description == "some description"
      assert exhibit.title == "some title"
      assert exhibit.width == 42
      assert exhibit.materials == "some materials"
      assert exhibit.height == 42
      assert exhibit.created == "some created"
      assert exhibit.costs == 120.5
    end

    test "create_exhibit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exhibits.create_exhibit(@invalid_attrs)
    end

    test "update_exhibit/2 with valid data updates the exhibit" do
      exhibit = exhibit_fixture()
      update_attrs = %{length: 43, description: "some updated description", title: "some updated title", width: 43, materials: "some updated materials", height: 43, created: "some updated created", costs: 456.7}

      assert {:ok, %Exhibit{} = exhibit} = Exhibits.update_exhibit(exhibit, update_attrs)
      assert exhibit.length == 43
      assert exhibit.description == "some updated description"
      assert exhibit.title == "some updated title"
      assert exhibit.width == 43
      assert exhibit.materials == "some updated materials"
      assert exhibit.height == 43
      assert exhibit.created == "some updated created"
      assert exhibit.costs == 456.7
    end

    test "update_exhibit/2 with invalid data returns error changeset" do
      exhibit = exhibit_fixture()
      assert {:error, %Ecto.Changeset{}} = Exhibits.update_exhibit(exhibit, @invalid_attrs)
      assert exhibit == Exhibits.get_exhibit!(exhibit.id)
    end

    test "delete_exhibit/1 deletes the exhibit" do
      exhibit = exhibit_fixture()
      assert {:ok, %Exhibit{}} = Exhibits.delete_exhibit(exhibit)
      assert_raise Ecto.NoResultsError, fn -> Exhibits.get_exhibit!(exhibit.id) end
    end

    test "change_exhibit/1 returns a exhibit changeset" do
      exhibit = exhibit_fixture()
      assert %Ecto.Changeset{} = Exhibits.change_exhibit(exhibit)
    end
  end
end
