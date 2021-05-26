defmodule Basketball.Repo.Migrations.CreateChampionships do
  use Ecto.Migration

  def change do
    create table(:championships) do
      add :year, :integer
      add :team_id, references(:teams, on_delete: :delete_all)
      add :mvp, references(:players, on_delete: :delete_all)

      timestamps()
    end

    create index(:championships, [:team_id])
    create index(:championships, [:mvp])
  end
end
