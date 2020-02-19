defmodule AuthMvp.Repo do
  use Ecto.Repo,
    otp_app: :auth_mvp,
    adapter: Ecto.Adapters.Postgres
end
