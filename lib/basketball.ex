defmodule Basketball do
  @moduledoc """
  Basketball keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  import Ecto.Query

  alias Basketball.BdSchemas.League
  alias Basketball.Repo

  def create_league(attrs) do
    %League{}
    |> League.changeset(attrs)
    |> Repo.insert()
  end

  def league_items(%{matching: acronym}) when is_binary(acronym) do
    League
    |> where([l], ilike(l.acronym, ^"%#{acronym}%"))
    |> Repo.all()
  end

  def league_items(_), do: Repo.all(League)
end
