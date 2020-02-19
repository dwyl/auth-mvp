defmodule AuthMvpWeb.GithubAuthController do
  use AuthMvpWeb, :controller
  @elixir_auth_github Application.get_env(:auth_mvp, :elixir_auth_github) || ElixirAuthGithub
  @doc """
  `index/2` handles the callback from GitHub Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => client}) do
    {:ok, profile} = @elixir_auth_github.github_auth(code)
    jwt = AuthMvp.Token.generate_and_sign!(%{email: profile.email})

    redirect(conn, external: "#{client}?jwt=#{jwt}")
  end
end
