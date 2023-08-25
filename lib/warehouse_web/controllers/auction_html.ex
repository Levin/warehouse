defmodule WarehouseWeb.AuctionHTML do
  use WarehouseWeb, :html

  embed_templates "auction_html/*"

  @doc """
  Renders a auction form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def auction_form(assigns)
end
