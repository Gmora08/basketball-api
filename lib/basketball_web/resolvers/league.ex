defmodule BasketballWeb.Resolvers.League do
  def league_items(_parent, args, _resolution) do
    {:ok, Basketball.league_items(args)}
  end
end
