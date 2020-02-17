defmodule AuthMvpWeb.GoogleAuthController do
  use AuthMvpWeb, :controller

  @doc """
  `index/2` handles the callback from Google Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => client}) do
    {:ok, token} = ElixirAuthGoogle.get_token(code, conn)
    {:ok, profile} = ElixirAuthGoogle.get_user_profile(token.access_token)

    redirect(conn, external: "#{client}?jwt=test.jwt.example")
  end
end
