defmodule Basketball.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :last_name, :string
      add :birth_date, :date
      add :born_place, :string
      add :heigth, :integer
      add :weight, :integer

      timestamps()
    end

  end
end
