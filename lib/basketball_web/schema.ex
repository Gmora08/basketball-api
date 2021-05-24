defmodule BasketballWeb.Schema do
  use Absinthe.Schema

  alias Basketball.BdSchemas.League
  alias BasketballWeb.Resolvers
  alias Basketball.Repo

  import_types BasketballWeb.Types

  query do
    @desc "Get a list of leagues"
    field :leagues, list_of(:league) do
      arg :matching, :string
      resolve &Resolvers.League.league_items/3
    end
  end
end
