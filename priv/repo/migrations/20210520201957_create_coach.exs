defmodule Basketball.Repo.Migrations.CreateCoach do
  use Ecto.Migration

  def change do
    create table(:coaches) do
      add :birth_date, :date
      add :name, :string
      add :last_name, :string

      timestamps()
    end
  end
end
