defmodule AuthMvpWeb.GoogleAuthControllerTest do
  use AuthMvpWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, Routes.google_auth_path(conn, :index, %{"code": "234", "state": "http://localhost/"}))

    assert html_response(conn, 302)
  end
end
