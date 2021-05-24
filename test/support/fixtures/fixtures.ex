defmodule Basketball.Fixtures do
  def league do
    quote do
      import Basketball.LeagueFixtures
    end
  end

  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture),
      do: apply(__MODULE__, fixture, [])
  end
end
