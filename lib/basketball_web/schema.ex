defmodule BasketballWeb.Schema do
  use Absinthe.Schema

  alias Basketball.BdSchemas.League
  alias Basketball.Repo

  import_types BasketballWeb.Types

  query do
    @desc "Get a list of leagues"
    field :leagues, list_of(:league) do
      resolve fn _parent, _args, _resolution ->
        {:ok, Repo.all(League)}
      end
    end
  end
end
