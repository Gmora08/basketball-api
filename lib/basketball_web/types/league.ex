defmodule BasketballWeb.Types.League do
  use Absinthe.Schema.Notation

  @desc "A league from around the world e.g. (NBA, LNBP)"
  object :league do
    field :id, :id
    field :name, :string
    field :acronym, :string
    field :foundation, :string
  end

  @desc "Filtering options for leagues query"
  input_object :league_filter do
    @desc "Matching id"
    field :id, non_null(:integer)

    @desc "Matching acronym"
    field :acronym, :string

    @desc "Matching name"
    field :name, :string
  end
end
