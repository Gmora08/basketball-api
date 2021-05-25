defmodule BasketballWeb.Types do
  use Absinthe.Schema.Notation

  @desc "Sort type"
  enum :sort_order do
    value :asc
    value :desc
  end
end
