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
end
