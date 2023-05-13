defmodule Partb.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :store_id, :integer
      add :street_address, :string
      add :city, :string
      add :state, :string
      add :zipcode, :string

      timestamps()
    end
  end
end
