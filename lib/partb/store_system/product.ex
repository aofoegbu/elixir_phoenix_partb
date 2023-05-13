defmodule Partb.StoreSystem.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :current_inventory_count, :integer
    field :product_name, :string
    field :vendor_name, :string
    field :wholesale_price, :integer
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_name, :vendor_name, :wholesale_price, :current_inventory_count])
    |> validate_required([:product_name, :vendor_name, :wholesale_price, :current_inventory_count])
  end
end
