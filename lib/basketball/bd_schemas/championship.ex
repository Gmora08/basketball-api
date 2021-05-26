defmodule Basketball.BdSchemas.Championship do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{Player, Team}

  @required_attributes ~w(player_id team_id year)a
  @optional_attributes ~w()a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "championships" do
    field :year, :integer
    # mvp
    belongs_to :players, Player, foreign_key: :player_id
    belongs_to :teams, Team, foreign_key: :team_id

    timestamps()
  end

  @doc false
  def changeset(championship, attrs) do
    championship
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
    |> foreign_key_constraint(:team_id)
    |> foreign_key_constraint(:player_id)
  end
end
