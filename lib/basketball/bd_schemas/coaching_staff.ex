defmodule Basketball.BdSchemas.CoachingStaff do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{Team, Coach}

  @required_attributes ~w(from rol coach_id team_id)a
  @optional_attributes ~w(to)a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "coaching_staff" do
    field :from, :date
    field :rol, :string
    field :to, :date
    belongs_to :coaches, Coach, foreign_key: :coach_id
    belongs_to :teams, Team, foreign_key: :team_id

    timestamps()
  end

  @doc false
  def changeset(coaching_staff, attrs) do
    coaching_staff
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
    |> foreign_key_constraint(:coach_id)
    |> foreign_key_constraint(:team_id)
  end
end
