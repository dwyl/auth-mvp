defmodule AuthMvpWeb.AuthUrlController do
  use AuthMvpWeb, :controller
  @elixir_auth_google Application.get_env(:auth_mvp, :elixir_auth_google) || ElixirAuthGoogle
  @elixir_auth_github Application.get_env(:auth_mvp, :elixir_auth_github) || ElixirAuthGithub

  def index(conn, _params) do
    referer = get_referer(conn) || ""
    google_url = @elixir_auth_google.generate_oauth_url(conn, referer)
    github_url = @elixir_auth_github.login_url(%{scope: ["user:email"], state: referer})

    urls = [%{url: google_url, type: "google"}, %{url: github_url, type: "github"}]
    render(conn, "index.json", urls: urls)
  end

  def login(conn, _params) do
    referer = get_referer(conn) || ""
    google_url = @elixir_auth_google.generate_oauth_url(conn, referer)
    github_url = @elixir_auth_github.login_url(%{scope: ["user:email"], state: referer})

    render(conn, "index.html", oauth_google_url: google_url, oauth_github_url: github_url)
  end

  defp get_referer(conn) do
    case List.keyfind(conn.req_headers, "referer", 0) do
      {"referer", referer} ->
        referer

      nil ->
        ""
    end
  end
end
