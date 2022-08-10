defmodule GraniteWeb.LandingControllerTest do
  use GraniteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Landing!"
  end

  test "health check up loads", %{conn: conn} do
    conn = get(conn, "/up")
    assert html_response(conn, 200)
  end

  describe "non existent subdomain" do
    @moduletag subdomain: "club-neverland"

    test "GET /", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Welcome to Landing!"
    end
  end
end
