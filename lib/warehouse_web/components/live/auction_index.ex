defmodule WarehouseWeb.Live.AuctionIndex do
  use WarehouseWeb, :live_view

  alias Warehouse.Auctions

  def mount(_params, _session, socket) do
    auctions =  Auctions.list_auctions()
                |> Enum.map(fn x -> extract(x) end)

    {:ok, assign(socket, auctions: auctions)}
  end

  def render(assigns) do
    ~H"""
    <.header>auctions</.header>
    <%= for x <- 0..1 do %> 
    <div class="bg-gray-50 rounded-xl mb-4 py-2">
    <.link href={"/api/auctions/#{Enum.at(Enum.at(@auctions, x), 0)}"}><%= Enum.at(@auctions, x) %></.link>
    </div>
    <% end %>
    """
  end

  def extract(%Warehouse.Auctions.Auction{id: id, title: title, description: description, location: location, institution: institution, theme: theme, duration: duration} = auction) do


    [id, title, description]

    #auction
    #|> Enum.map(fn x -> %{id: x.id, title: x.title} end)
    #|> Enum.each(fn x -> IO.inspect(x) end)
  end

end


