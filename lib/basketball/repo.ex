defmodule Basketball.Repo do
  use Ecto.Repo,
    otp_app: :basketball,
    adapter: Ecto.Adapters.Postgres
end
