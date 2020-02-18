defmodule AuthMvpWeb.GithubAuthController do
  use AuthMvpWeb, :controller

  @elixir_auth_github Application.get_env(:auth_mvp, :elixir_auth_github) || ElixirAuthGithub
  @doc """
  `index/2` handles the callback from GitHub Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => client}) do
    {:ok, _profile} = @elixir_auth_github.github_auth(code)

    redirect(conn, external: "#{client}?jwt=test.jwt.example")
  end
end
