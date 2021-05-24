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
          %{"acronym" => "NBA"},
          %{"acronym" => "LNBP"}
        ]
      }
    }
  end
end
