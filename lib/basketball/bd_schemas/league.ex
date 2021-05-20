defmodule Basketball.BdSchemas.League do
  use Ecto.Schema
  import Ecto.Changeset

  schema "leagues" do
    field :acronym, :string
    field :foundation, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, [:name, :acronym, :foundation])
    |> validate_required([:name, :acronym, :foundation])
  end
end
