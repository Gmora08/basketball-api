defmodule BasketballWeb.Types.League do
  use Absinthe.Schema.Notation

  alias Absinthe.Blueprint

  @desc "A league from around the world e.g. (NBA, LNBP)"
  object :league_item do
    field :id, :id
    field :name, :string
    field :acronym, :string
    field :foundation, :date
    field :teams, list_of(:team_item) do
      resolve &BasketballWeb.Resolvers.Team.teams_by_league/3
    end
  end

  @desc "Filtering options for leagues query"
  input_object :league_filter do
    @desc "Matching id"
    field :id, :integer

    @desc "Matching acronym"
    field :acronym, :string

    @desc "Matching name"
    field :name, :string

    @desc "League founded before this date"
    field :founded_before, :date

    @desc "League founded after this date"
    field :founded_after, :date
  end

  scalar :date do
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
