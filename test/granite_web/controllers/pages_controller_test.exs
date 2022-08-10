defmodule GraniteWeb.PagesControllerTest do
  use GraniteWeb.ConnCase

  @moduletag subdomain: "club-alpha"

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Subdomain!"
  end

  test "GET /privacy", %{conn: conn} do
    conn = get(conn, "/privacy")
    assert html_response(conn, 200) =~ "privacy"
  end
end
