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

  @desc "Input object to create a team"
  input_object :team_item_input do
    field :name, non_null(:string)
    field :city, non_null(:string)
    field :logo, non_null(:string)
    field :foundation, non_null(:date_team)
    field :league_id, non_null(:id)
  end

  object :team_item_result do
    field :team_item, :team_item
    field :errors, list_of(:input_error)
  end

  object :input_error do
    field :key, non_null(:string)
    field :message, non_null(:string)
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
