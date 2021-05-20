defmodule BasketballWeb.PageController do
  use BasketballWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
