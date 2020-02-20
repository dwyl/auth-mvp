defmodule AuthMvpWeb.PersonControllerTest do
  use AuthMvpWeb.ConnCase
  alias AuthMvp.People.Person

  test "GET /person/info wihtout Authorization header returns 401", %{conn: conn} do
    conn = get(conn, "/person/info")
    assert conn.status == 401
  end

  test "Get /person/info returns person email when request header authorization is correct" do
    assert {:ok, %Person{} = person} = AuthMvp.People.create_person(%{email: "person@dwyl.com"})
    jwt = AuthMvp.Token.generate_and_sign!(%{email: "person@dwyl.com"})
    conn = build_conn()
           |> put_req_header("authorization", "Bearer #{jwt}")
           |> get("/person/info")

    assert json_response(conn,200) == %{"data" => %{"email" => "person@dwyl.com"}}
  end
end
