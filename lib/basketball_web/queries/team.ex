defmodule BasketballWeb.Queries.Team do
  use Absinthe.Schema.Notation

  alias BasketballWeb.Resolvers

  object :team_queries do
    @desc "Get a list of teams"
    field :team_items, list_of(:team_item) do
      resolve &Resolvers.Team.team_items/3
    end
  end
end
