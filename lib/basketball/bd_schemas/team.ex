defmodule Basketball.BdSchemas.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :city, :string
    field :foundation, :string
    field :logo, :string
    field :name, :string
    field :league_id, :id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :city, :logo, :foundation])
    |> validate_required([:name, :city, :logo, :foundation])
  end
end
