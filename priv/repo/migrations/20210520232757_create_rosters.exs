defmodule Basketball.Repo.Migrations.CreateRosters do
  use Ecto.Migration

  def change do
    create table(:rosters) do
      add :number, :string
      add :from, :date
      add :to, :date
      add :team_id, references(:teams, on_delete: :nothing)
      add :player_id, references(:players, on_delete: :nothing)

      timestamps()
    end

    create index(:rosters, [:team_id])
    create index(:rosters, [:player_id])
  end
end
