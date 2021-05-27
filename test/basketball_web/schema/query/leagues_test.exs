defmodule BasketballWeb.Schema.Query.LeaguesTest do
  use BasketballWeb.ConnCase, async: true
  use Basketball.Fixtures, [:league]

  @query """
  {
    leagueItems {
      acronym
    }
  }
  """
  test "leagues query returns a list of leagues", %{conn: conn} do
    league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})

    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
      "data" => %{
        "leagueItems" => [
          %{"acronym" => "LNBP"},
          %{"acronym" => "NBA"}
        ]
      }
    }
  end

  @query """
  {
    leagueItems(order: DESC) {
      acronym
    }
  }
  """
  test "leagues query returns a list of leagues ordered by acronym desc", %{conn: conn} do
    league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})

    conn = get conn, "/api", query: @query

    assert json_response(conn, 200) == %{
      "data" => %{
        "leagueItems" => [
          %{"acronym" => "NBA"},
          %{"acronym" => "LNBP"}
        ]
      }
    }
  end

  @query """
  {
    leagueItems(filter: {acronym: "NBA"}) {
      acronym
    }
  }
  """
  test "leagues query returns leagues filtered by acronym", %{conn: conn} do
    league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})
    response = get(conn, "/api", query: @query)

    assert json_response(response, 200) == %{
      "data" => %{
        "leagueItems" => [
          %{"acronym" => "NBA"}
        ]
      }
    }
  end

  @query """
  {
    leagueItems(filter: {acronym: 123}) {
      acronym
    }
  }
  """
  test "leagues query returns errors when using a bad value for matching", %{conn: conn} do
    league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})
    response = get(conn, "/api", query: @query)

    assert %{"errors" => [%{"message" => message}]} = json_response(response, 200)
    assert message == "Argument \"filter\" has invalid value {acronym: 123}.\nIn field \"acronym\": Expected type \"String\", found 123."
  end

  @query """
  query($filter: LeagueFilter!) {
    leagueItems(filter: $filter) {
      acronym
    }
  }
  """
  @variables %{"filter" => %{"acronym" => "NBA"}}
  test "returns leagues filtered by acronym using variables", %{conn: conn} do
    league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})
    response = get(conn, "/api", query: @query, variables: @variables)

    assert json_response(response, 200) == %{
      "data" => %{
        "leagueItems" => [
          %{"acronym" => "NBA"}
        ]
      }
    }
  end

  @query """
  query($filter: LeagueFilter) {
    leagueItems(filter: $filter) {
      id
    }
  }
  """
  test "returns the league with the given id associated", %{conn: conn} do
    league = league_fixture(%{acronym: "NBA"})
    league_fixture(%{acronym: "LNBP"})
    variables = %{"filter" => %{"id" => league.id}}

    response = get(conn, "/api", query: @query, variables: Jason.encode!(variables))

    assert json_response(response, 200) == %{
      "data" => %{
        "leagueItems" => [
          %{"id" => "#{league.id}"}
        ]
      }
    }
  end
end
