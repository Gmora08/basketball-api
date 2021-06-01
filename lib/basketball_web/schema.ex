defmodule BasketballWeb.Schema do
  use Absinthe.Schema

  import_types BasketballWeb.Types
  import_types BasketballWeb.Queries.League
  import_types BaskteballWeb.Types.Team
  import_types BasketballWeb.Types.League
  import_types BasketballWeb.Queries.Search

  query do
    import_fields :league_queries
    import_fields :search_queries
  end

  mutation do
    field :create_team_item, :team_item do
      @desc "Creates a new team"
      arg :input, non_null(:team_item_input)
      resolve &BasketballWeb.Resolvers.Team.create_team/3
      middleware BasketballWeb.Middleware.ChangesetErrors
    end
  end
end
