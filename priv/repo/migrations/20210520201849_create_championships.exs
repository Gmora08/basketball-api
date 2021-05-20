defmodule Basketball.Repo.Migrations.CreateChampionships do
  use Ecto.Migration

  def change do
    create table(:championships) do
      add :year, :string
      add :team_id, references(:teams, on_delete: :nothing)
      add :mvp, references(:players, on_delete: :nothing)

      timestamps()
    end

    create index(:championships, [:team_id])
    create index(:championships, [:mvp])
  end
end