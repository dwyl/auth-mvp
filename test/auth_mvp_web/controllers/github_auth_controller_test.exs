defmodule AuthMvpWeb.GithubAuthControllerTest do
  use AuthMvpWeb.ConnCase

  test "GET /auth/github/callback", %{conn: conn} do
    conn = get(conn, Routes.github_auth_path(conn, :index, %{code: "123", state: "http://localhost/"}))
    assert html_response(conn, 302)
  end
end
