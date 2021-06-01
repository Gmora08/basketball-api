defmodule BasketballWeb.Middleware.ChangesetErrors do
  @behaviour Absinthe.Middleware

  def call(resolution, _) do
    IO.inspect(Enum.flat_map(resolution.errors, &handle_error/1), label: "=======>")

    %{resolution |
      errors: Enum.flat_map(resolution.errors, &handle_error/1)
    }
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    changeset
      |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
      |> Enum.map(fn({k,v}) -> "#{k}: #{v}" end)
  end
  defp handle_error(error), do: [error]
end
