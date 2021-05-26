defmodule Basketball.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :city, :string
      add :logo, :string
      add :foundation, :date
      add :league_id, references(:leagues, on_delete: :delete_all)

      timestamps()
    end

    create index(:teams, [:league_id])
  end
end
