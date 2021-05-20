defmodule Basketball.BdSchemas.Championship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "championships" do
    field :year, :string
    field :team_id, :id
    field :mvp, :id

    timestamps()
  end

  @doc false
  def changeset(championship, attrs) do
    championship
    |> cast(attrs, [:year])
    |> validate_required([:year])
  end
end
