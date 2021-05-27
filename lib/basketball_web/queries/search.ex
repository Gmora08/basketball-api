defmodule BasketballWeb.Queries.Search do
  use Absinthe.Schema.Notation
  alias BasketballWeb.Resolvers

  object :search_queries do
    field :search, list_of(:search_result) do
      arg :matching, non_null(:integer)
      resolve &Resolvers.search/3
    end
  end
end
