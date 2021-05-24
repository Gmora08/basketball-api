defmodule BasketballWeb.Types do
  use Absinthe.Schema.Notation

  @desc "A league from around the world e.g. (NBA, LNBP)"
  object :league do
    field :id, :id
    field :name, :string
    field :acronym, :string
    field :foundation, :string
  end
end
