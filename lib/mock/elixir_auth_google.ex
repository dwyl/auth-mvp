defmodule AuthMvp.Mock.ElixirAuthGoogle do

  def generate_oauth_url(_conn, _state) do
    "google oauth url"
  end


  def get_token(_code, _conn) do
    {:ok, %{:access_token => "token"}}
  end

  def get_user_profile(_token) do
    {:ok,
     %{
       email: "nelson@gmail.com",
       email_verified: true,
       family_name: "Correia",
       given_name: "Nelson",
       locale: "en",
       name: "Nelson Correia",
       picture: "https://lh3.googleusercontent.com/a-/AAuE7mApnYb260YC1JY7a",
       sub: "940732358705212133793"
     }}
  end
end
