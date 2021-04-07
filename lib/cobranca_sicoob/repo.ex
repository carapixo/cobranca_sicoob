defmodule CobrancaSicoob.Repo do
  use Ecto.Repo,
    otp_app: :cobranca_sicoob,
    adapter: Ecto.Adapters.Postgres
end
