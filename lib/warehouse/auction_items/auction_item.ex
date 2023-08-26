defmodule Warehouse.AuctionItems.AuctionItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Warehouse.AuctionItems
  alias Warehouse.Exhibits

  schema "auctionitems" do
    field :auction_id, :integer
    field :exhibit_id, :integer

    timestamps()
  end

  @doc false
  def changeset(auction_item, attrs) do
    auction_item
    |> cast(attrs, [:auction_id, :exhibit_id])
    |> validate_required([:auction_id, :exhibit_id])
  end

  def prepared_items() do
    items = AuctionItems.list_auctionitems()
    copy_ids = items

    copy_ids
    |> Enum.map(fn %__MODULE__{auction_id: id} -> id end)


    items
    |> Enum.map(fn %__MODULE__{} = item -> Exhibits.get_exhibit!(item.exhibit_id) end)
    |> Enum.map(fn %Warehouse.Exhibits.Exhibit{} = item -> %{ id: item.id, title: item.title, description: item.description, materials: item.materials, height: item.height, width: item.width, length: item.length, created: item.created, costs: item.costs} end)


    {items, copy_ids}

  end


  def map_auction_to_item(id) do
    link = AuctionItems.get_auction_item!(id)

    %Warehouse.Exhibits.Exhibit{id: id,title: title, description: description} = Exhibits.get_exhibit!(link.exhibit_id)


    
  

    IO.inspect(id)
    IO.inspect(title)
    IO.inspect(description)

    [id, title, description]


  end

end
