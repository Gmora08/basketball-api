defmodule Basketball.BdSchemas.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :birth_date, :date
    field :born_place, :string
    field :heigth, :integer
    field :last_name, :string
    field :name, :string
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :last_name, :birth_date, :born_place, :heigth, :weight])
    |> validate_required([:name, :last_name, :birth_date, :born_place, :heigth, :weight])
  end
end
