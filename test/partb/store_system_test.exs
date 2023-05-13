defmodule Partb.StoreSystemTest do
  use Partb.DataCase

  alias Partb.StoreSystem

  describe "stores" do
    alias Partb.StoreSystem.Store

    import Partb.StoreSystemFixtures

    @invalid_attrs %{city: nil, state: nil, store_id: nil, street_address: nil, zipcode: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert StoreSystem.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert StoreSystem.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{city: "some city", state: "some state", store_id: 42, street_address: "some street_address", zipcode: "some zipcode"}

      assert {:ok, %Store{} = store} = StoreSystem.create_store(valid_attrs)
      assert store.city == "some city"
      assert store.state == "some state"
      assert store.store_id == 42
      assert store.street_address == "some street_address"
      assert store.zipcode == "some zipcode"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreSystem.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{city: "some updated city", state: "some updated state", store_id: 43, street_address: "some updated street_address", zipcode: "some updated zipcode"}

      assert {:ok, %Store{} = store} = StoreSystem.update_store(store, update_attrs)
      assert store.city == "some updated city"
      assert store.state == "some updated state"
      assert store.store_id == 43
      assert store.street_address == "some updated street_address"
      assert store.zipcode == "some updated zipcode"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreSystem.update_store(store, @invalid_attrs)
      assert store == StoreSystem.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = StoreSystem.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> StoreSystem.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = StoreSystem.change_store(store)
    end
  end

  describe "products" do
    alias Partb.StoreSystem.Product

    import Partb.StoreSystemFixtures

    @invalid_attrs %{current_inventory_count: nil, product_name: nil, vendor_name: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert StoreSystem.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert StoreSystem.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{current_inventory_count: 42, product_name: "some product_name", vendor_name: "some vendor_name", wholesale_price: 42}

      assert {:ok, %Product{} = product} = StoreSystem.create_product(valid_attrs)
      assert product.current_inventory_count == 42
      assert product.product_name == "some product_name"
      assert product.vendor_name == "some vendor_name"
      assert product.wholesale_price == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreSystem.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{current_inventory_count: 43, product_name: "some updated product_name", vendor_name: "some updated vendor_name", wholesale_price: 43}

      assert {:ok, %Product{} = product} = StoreSystem.update_product(product, update_attrs)
      assert product.current_inventory_count == 43
      assert product.product_name == "some updated product_name"
      assert product.vendor_name == "some updated vendor_name"
      assert product.wholesale_price == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreSystem.update_product(product, @invalid_attrs)
      assert product == StoreSystem.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = StoreSystem.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> StoreSystem.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = StoreSystem.change_product(product)
    end
  end
end
