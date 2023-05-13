defmodule Partb.Repo do
  use Ecto.Repo,
    otp_app: :partb,
    adapter: Ecto.Adapters.Postgres
end
