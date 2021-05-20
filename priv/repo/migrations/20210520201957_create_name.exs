defmodule Basketball.Repo.Migrations.CreateName do
  use Ecto.Migration

  def change do
    create table(:name) do
      add :last_name, :string
      add :birth_date, :date

      timestamps()
    end

  end
end
