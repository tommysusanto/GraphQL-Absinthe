defmodule Graphqlabsinthe.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :home_address, :string
      add :email, :string
      add :friends_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:friends_id])
  end
end
