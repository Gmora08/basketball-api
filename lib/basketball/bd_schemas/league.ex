defmodule Basketball.BdSchemas.League do
  use Ecto.Schema
  import Ecto.Changeset

  alias Basketball.BdSchemas.Team

  @required_attributes ~w(acronym foundation name)a
  @optional_attributes ~w()a
  @allowed_attributes @required_attributes ++ @optional_attributes

  schema "leagues" do
    field :acronym, :string
    field :foundation, :date
    field :name, :string
    has_many :teams, Team

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, @allowed_attributes)
    |> validate_required(@required_attributes)
  end
end
