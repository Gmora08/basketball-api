defmodule Basketball.BdSchemas.Coach do
  use Ecto.Schema
  import Ecto.Changeset

  schema "name" do
    field :birth_date, :date
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(coach, attrs) do
    coach
    |> cast(attrs, [:last_name, :birth_date])
    |> validate_required([:last_name, :birth_date])
  end
end
