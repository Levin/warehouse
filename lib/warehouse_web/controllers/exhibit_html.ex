defmodule WarehouseWeb.ExhibitHTML do
  use WarehouseWeb, :html

  embed_templates "exhibit_html/*"

  @doc """
  Renders a exhibit form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def exhibit_form(assigns)
end
