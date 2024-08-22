defmodule TalentBase.Repo do
  use Ecto.Repo,
    otp_app: :talent_base,
    adapter: Ecto.Adapters.Postgres
end
