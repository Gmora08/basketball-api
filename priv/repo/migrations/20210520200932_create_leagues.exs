defmodule Basketball.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues) do
      add :name, :string
      add :acronym, :string
      add :foundation, :date

      timestamps()
    end

  end
end
