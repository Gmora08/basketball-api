defmodule BasketballWeb.Resolvers do
  def search(_parent, %{matching: term}, _resolution) do
    {:ok, Basketball.search(term)}
  end
end
