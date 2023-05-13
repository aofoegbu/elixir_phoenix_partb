defmodule Partb.StoreSystemFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Partb.StoreSystem` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        city: "some city",
        state: "some state",
        store_id: 42,
        street_address: "some street_address",
        zipcode: "some zipcode"
      })
      |> Partb.StoreSystem.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        current_inventory_count: 42,
        product_name: "some product_name",
        vendor_name: "some vendor_name",
        wholesale_price: 42
      })
      |> Partb.StoreSystem.create_product()

    product
  end
end
