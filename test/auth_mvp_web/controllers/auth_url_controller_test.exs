defmodule AuthMvpWeb.AuthUrlControllerTest do
  use AuthMvpWeb.ConnCase

  test "GET /auth/urls", %{conn: conn} do
    conn = get(conn, "/auth/urls")
    assert json_response(conn, 200)
  end
end
