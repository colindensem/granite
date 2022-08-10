defmodule GraniteWeb.PageController do
  use GraniteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def privacy(conn, _params) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(:ok, "privacy")
  end
end
