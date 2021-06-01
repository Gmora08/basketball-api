defmodule Basketball.Repo.Migrations.AddTeamUniqueIndex do
  use Ecto.Migration

  def change do
    create unique_index(:teams, [:name])
  end
end
