defmodule AuthMvp.EmailTest do
  use ExUnit.Case
  # alias AuthMvp.People.Person
  describe "AuthMvp.Email" do
    test "send/1 an email" do
      params = %{
        "email" => "success@simulator.amazonses.com",
        "name" => "Super Successful",
        "template" => "welcome"
      }
      IO.inspect(params, label: "params")
      res = AuthMvp.Email.send(params)
      IO.inspect(res, label: "res")
    end
  end

  # test "Get /person/info returns person email when request header authorization is correct" do
  #   assert {:ok, %Person{} = person} = AuthMvp.People.create_person(%{email: "person@dwyl.com"})
  #   jwt = AuthMvp.Token.generate_and_sign!(%{email: "person@dwyl.com"})
  #
  #   conn =
  #     build_conn()
  #     |> put_req_header("authorization", "Bearer #{jwt}")
  #     |> get("/person/info")
  #
  #   response = json_response(conn, 200)
  #   assert response["data"]["email"] == "person@dwyl.com"
  # end
end
