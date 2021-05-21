defmodule Basketball.BdSchemas.Coach do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.{CoachingStaff, Team}

  @required_attributes ~w(birth_date name last_name)a
  @optional_attributes ~w()a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "coaches" do
    field :birth_date, :date
    field :name, :string
    field :last_name, :string
    many_to_many :teams, Team, join_through: CoachingStaff

    timestamps()
  end

  @doc false
  def changeset(coach, attrs) do
    coach
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
  end
end
