defmodule Basketball.LeagueFixtures do

  @valid_attrs %{acronym: "NBA", foundation: Date.from_iso8601!("1964-06-06"), name: "National Basketball League"}

  def league_fixture(attrs \\ %{}) do
    {:ok, league} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Basketball.create_league()

    league
  end
end
