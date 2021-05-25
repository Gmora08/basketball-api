defmodule BasketballWeb.Schema do
  use Absinthe.Schema

  alias BasketballWeb.Resolvers

  import_types BasketballWeb.Types
  import_types BasketballWeb.Types.League

  query do
    @desc "Get a list of leagues"
    field :leagues, list_of(:league) do
      arg :filter, :league_filter
      # arg :order, :sort_order
      # more explicit argument declaration
      arg :order, type: :sort_order, default_value: :asc
      resolve &Resolvers.League.league_items/3
    end
  end
end
