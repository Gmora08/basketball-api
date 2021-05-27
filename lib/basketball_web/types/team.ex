defmodule BaskteballWeb.Types.Team do
  use Absinthe.Schema.Notation

  alias Absinthe.Blueprint

  @desc "Teams composing a league"
  object :team_item do
    interfaces [:search_result]
    field :id, :id
    field :foundation, :date_team
    field :city, :string
    field :logo, :string
    field :name, :string
  end

  scalar :date_team do
    parse fn input ->
      with %Blueprint.Input.String{value: value} <- input,
           {:ok, date} <- Date.from_iso8601(value) do
        {:ok, date}
      else
        _ -> :error
      end
    end

    serialize fn date ->
      Date.to_iso8601(date)
    end
  end
end
