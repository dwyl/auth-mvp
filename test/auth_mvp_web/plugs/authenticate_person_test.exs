defmodule AuthMvp.Plugs.AuthenticatePersonTest do
  use AuthMvpWeb.ConnCase

  test "Plug return 401 wiht not Authorization Header" do
    conn = AuthMvp.Plugs.AuthenticatePerson.call(build_conn(), %{})

    assert conn.status == 401
  end

  test "Plug return 401 wiht incorrect jwt header" do
    conn = build_conn()
           |> put_req_header("authorization", "Bearer incorrect.jwt")
           |> AuthMvp.Plugs.AuthenticatePerson.call(%{})

    assert conn.status == 401
  end

  test "Plug assigns claims to conn with valid jwt" do
    jwt = AuthMvp.Token.generate_and_sign!(%{email: "person@dwyl.com", session: 1 })
    conn = build_conn()
           |> put_req_header("authorization", "Bearer #{jwt}")
           |> AuthMvp.Plugs.AuthenticatePerson.call(%{})

    assert conn.assigns.claims.email == "person@dwyl.com"
  end
end
