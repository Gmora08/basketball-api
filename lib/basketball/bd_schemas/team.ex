defmodule Basketball.BdSchemas.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{Coach, CoachingStaff, Championship, League, Player, Roster}

  @required_attributes ~w(city foundation logo league_id name)a
  @optional_attributes ~w()a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "teams" do
    field :city, :string
    field :foundation, :date
    field :logo, :string
    field :name, :string
    has_many :championships, Championship
    many_to_many :players, Player, join_through: Roster
    many_to_many :coaches, Coach, join_through: CoachingStaff
    belongs_to :leagues, League, foreign_key: :league_id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
    |> foreign_key_constraint(:league_id)
    |> unique_constraint(:name)
  end
end
