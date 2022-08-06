defmodule GraniteWeb.PageController do
  use GraniteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def up(conn, _params) do
    Ecto.Adapters.SQL.query!(Granite.Repo, "SELECT 1")

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(:ok, "ok")
  end
end
