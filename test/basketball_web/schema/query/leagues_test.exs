defmodule BasketballWeb.Schema.Query.LeaguesTest do
  use BasketballWeb.ConnCase, async: true
  use Basketball.Fixtures, [:league]

  @query """
  {
    leagues {
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
        "leagues" => [
          %{"acronym" => "LNBP"},
          %{"acronym" => "NBA"}
        ]
      }
    }
  end

  @query """
  {
    leagues(order: DESC) {
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
        "leagues" => [
          %{"acronym" => "NBA"},
          %{"acronym" => "LNBP"}
        ]
      }
    }
  end

  @query """
  {
    leagues(filter: {acronym: "NBA"}) {
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
        "leagues" => [
          %{"acronym" => "NBA"}
        ]
      }
    }
  end

  @query """
  {
    leagues(filter: {acronym: 123}) {
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
    leagues(filter: $filter) {
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
        "leagues" => [
          %{"acronym" => "NBA"}
        ]
      }
    }
  end
end
