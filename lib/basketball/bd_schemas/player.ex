defmodule Basketball.BdSchemas.Player do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{Team, Roster}

  @required_attributes ~w(birth_date born_place heigth last_name name weight)a
  @optional_attributes ~w()a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "players" do
    field :birth_date, :date
    field :born_place, :string
    field :heigth, :integer
    field :last_name, :string
    field :name, :string
    field :weight, :integer
    many_to_many :teams, Team, join_through: Roster

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
  end
end
