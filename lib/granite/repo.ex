defmodule Granite.Repo do
  use Ecto.Repo,
    otp_app: :granite,
    adapter: Ecto.Adapters.SQLite3
end
