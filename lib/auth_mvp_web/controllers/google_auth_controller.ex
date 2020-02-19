defmodule AuthMvpWeb.GoogleAuthController do
  use AuthMvpWeb, :controller

  @elixir_auth_google Application.get_env(:auth_mvp, :elixir_auth_google) || ElixirAuthGoogle

  @doc """
  `index/2` handles the callback from Google Auth API redirect.
  """
  def index(conn, %{"code" => code} = params) do
    {:ok, token} = @elixir_auth_google.get_token(code, conn)
    {:ok, profile} = @elixir_auth_google.get_user_profile(token.access_token)
    jwt = AuthMvp.Token.generate_and_sign!(%{email: profile.email})

    redirect(conn, external: "#{params["client"]}?jwt=#{jwt}")
  end
end
