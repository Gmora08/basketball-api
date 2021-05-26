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

  def league_items(filters) do
    filters
    |> Enum.reduce(League, fn
      {_, nil}, query -> query
      {:order, order}, query ->
        from q in query, order_by: {^order, :acronym}
      {:filter, filter}, query ->
        filter_with(query, filter)
    end)
    |> Repo.all()
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:id, id}, query ->
        with_id(query, id)
      {:acronym, acronym}, query ->
        with_acronym(query, acronym)

      {:name, name}, query ->
        with_name(query, name)

      {:founded_before, date}, query ->
        before_date(query, date)

      {:founded_after, date}, query ->
        after_date(query, date)
    end)
  end

  defp with_id(query, id) do
    from q in query, where: q.id == ^id
  end

  defp with_name(query, name) do
    from q in query, where: ilike(q.name, ^"%#{name}%")
  end

  defp with_acronym(query, acronym) do
    from q in query, where: q.acronym == ^acronym
  end

  defp after_date(query, date) do
    from q in query, where: ^date <= q.foundation
  end

  defp before_date(query, date) do
    from q in query, where: ^date >= q.foundation
  end
end
