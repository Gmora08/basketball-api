defmodule BasketballWeb.Queries.League do
  use Absinthe.Schema.Notation

  alias BasketballWeb.Resolvers

  object :league_queries do
    @desc "Get a list of leagues"
    field :league_items, list_of(:league_item) do
      arg :filter, :league_filter
      # arg :order, :sort_order
      # more explicit argument declaration
      arg :order, type: :sort_order, default_value: :asc
      resolve &Resolvers.League.league_items/3
    end
  end
end
