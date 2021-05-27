defmodule BasketballWeb.Types do
  use Absinthe.Schema.Notation

  alias Basketball.BdSchemas.{League, Team}

  @desc "Sort type"
  enum :sort_order do
    value :asc
    value :desc
  end

  # union :search_result do
  #   @desc "A search result"
  #   types [:team_item, :league_item]

  #   resolve_type fn
  #     %League{}, _ -> :league_item
  #     %Team{}, _ -> :team_item
  #     _, _ -> nil
  #   end
  # end

  interface :search_result do
    field :id, :id
    resolve_type fn
      %League{}, _ -> :league_item
      %Team{}, _ -> :team_item
      _, _ -> nil
    end
  end
end
