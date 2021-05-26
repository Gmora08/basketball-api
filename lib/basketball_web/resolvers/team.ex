defmodule BasketballWeb.Resolvers.Team do
  def team_items(_parent, args, _resolution) do
    {:ok, Basketball.team_items(args)}
  end

  def teams_by_league(league, args, _resolution) do
    {:ok, Basketball.teams_by_league(league, args)}
  end
end
