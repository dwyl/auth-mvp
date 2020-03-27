defmodule AuthMvp.EmailTest do
  use ExUnit.Case

  describe "AuthMvp.Email" do
    test "sendemail/1 an email" do
      params = %{
        "email" => "success@simulator.amazonses.com",
        "name" => "Super Successful",
        "template" => "welcome"
      }
      # IO.inspect(params, label: "params")
      res = AuthMvp.Email.sendemail(params)
      assert Map.get(params, "email") == Map.get(res, "email")
      assert Map.get(res, "id") > 0
    end
  end
end
