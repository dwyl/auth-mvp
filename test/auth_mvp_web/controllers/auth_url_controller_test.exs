defmodule AuthMvpWeb.AuthUrlControllerTest do
  use AuthMvpWeb.ConnCase

  test "GET /auth/urls with referer", %{conn: conn} do
    conn =
      conn
      |> put_req_header("referer", "http://locahost:4000/")
      |> get("/auth/urls")

    assert html_response(conn, 200)
  end

  test "GET /auth/urls", %{conn: conn} do
    conn = get(conn, "/auth/urls")
    assert html_response(conn, 200)
  end

  test "GET /auth/urls with referer using api", %{conn: conn} do
    conn =
      conn
      |> put_req_header("referer", "http://locahost:4000/")
      |> put_req_header("accept", "application/json")
      |> get("/auth/urls")

    assert json_response(conn, 200)
  end

  test "GET /auth/urls using api", %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> get("/auth/urls")

    assert json_response(conn, 200)
  end
end
