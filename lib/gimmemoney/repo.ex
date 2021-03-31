defmodule Gimmemoney.Repo do
  use Ecto.Repo,
    otp_app: :gimmemoney,
    adapter: Ecto.Adapters.Postgres
end
