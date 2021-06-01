defmodule BasketballWeb.Resolvers.Team do
  def team_items(_parent, args, _resolution) do
    {:ok, Basketball.team_items(args)}
  end

  def teams_by_league(league, args, _resolution) do
    {:ok, Basketball.teams_by_league(league, args)}
  end

  def create_team(_, %{input: params}, _) do
    case Basketball.create_team(params) do
      {:error, changeset} ->
        {:error, changeset}

      {:ok, _} = res ->
        res
    end
  end
end
