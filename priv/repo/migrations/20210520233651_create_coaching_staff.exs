defmodule Basketball.Repo.Migrations.CreateCoachingStaff do
  use Ecto.Migration

  def change do
    create table(:coaching_staff) do
      add :from, :date
      add :to, :date
      add :rol, :string
      add :team_id, references(:teams, on_delete: :nothing)
      add :coach_id, references(:coaches, on_delete: :nothing)

      timestamps()
    end

    create index(:coaching_staff, [:team_id])
    create index(:coaching_staff, [:coach_id])
  end
end
