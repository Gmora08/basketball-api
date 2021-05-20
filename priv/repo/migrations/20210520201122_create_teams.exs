defmodule Basketball.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :city, :string
      add :logo, :string
      add :foundation, :string
      add :league_id, references(:leagues, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:league_id])
  end
end
