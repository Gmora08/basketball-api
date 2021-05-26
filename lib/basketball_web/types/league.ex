defmodule BasketballWeb.Types.League do
  use Absinthe.Schema.Notation

  @desc "A league from around the world e.g. (NBA, LNBP)"
  object :league do
    field :id, :id
    field :name, :string
    field :acronym, :string
    field :foundation, :date
  end

  @desc "Filtering options for leagues query"
  input_object :league_filter do
    @desc "Matching id"
    field :id, :integer

    @desc "Matching acronym"
    field :acronym, :string

    @desc "Matching name"
    field :name, :string
  end

  scalar :date do
    parse fn input ->
      case Date.from_iso8601(input.value) do
        {:ok, date} -> {:ok, date}
        _ -> :error
      end
    end

    serialize fn date ->
      Date.to_iso8601(date)
    end
  end
end
