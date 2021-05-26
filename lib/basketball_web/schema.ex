defmodule BasketballWeb.Schema do
  use Absinthe.Schema

  import_types BasketballWeb.Types
  import_types BasketballWeb.Queries.League
  import_types BasketballWeb.Types.League

  query do
    import_fields :league_queries
  end
end
