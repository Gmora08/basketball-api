defmodule Basketball.BdSchemas.Roster do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{Team, Player}

  @required_attributes ~w(from number team_id player_id)a
  @optional_attributes ~w(to)a
  @allowed_attributes @required_attributes ++ @optional_attributes

  @primary_key false
  schema "rosters" do
    field :from, :date
    field :number, :string
    field :to, :date, default: nil
    belongs_to :teams, Team, foreign_key: :team_id
    belongs_to :players, Player, foreign_key: :player_id

    timestamps()
  end

  @doc false
  def changeset(roster, attrs) do
    roster
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
    |> foreign_key_constraint(:team_id)
    |> foreign_key_constraint(:player_id)
  end
end
