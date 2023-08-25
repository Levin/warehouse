defmodule WarehouseWeb.ExhibitLive do
  use WarehouseWeb, :live_view
  alias Warehouse.Exhibits.Exhibit

  def mount(_params, _session, socket) do
    exhibits = Exhibit.prepared_exhibits
    {:ok, assign(socket, exhibits: exhibits)}
  end

  def render(assigns) do
    ~H"""
    <.header>Exhibits</.header>

    <%= for item <- 0..1 do %>
      <div> 
        <h1><%= Enum.at(@exhibits, item).title %></h1>
        <p><%= Enum.at(@exhibits, item).description %></p>
        <p><%= Enum.at(@exhibits, item).materials %></p>
        <p><%= Enum.at(@exhibits, item).costs %></p>
        <hr>
      </div>
    <% end %>


    """
  end


end


