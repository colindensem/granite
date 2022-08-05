defmodule Club.Repo do
  use Ecto.Repo,
    otp_app: :club,
    adapter: Ecto.Adapters.SQLite3
end
