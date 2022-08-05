defmodule ClubWeb.PageControllerTest do
  use ClubWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "health check up loads", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :up))
    assert html_response(conn, 200)
  end
end
