defmodule AuthMvpWeb.AuthUrlController do
  use AuthMvpWeb, :controller

  def login(conn, _params) do
    referer = get_referer(conn) || ""
    google_url = ElixirAuthGoogle.generate_oauth_url(conn, referer)
    github_url = ElixirAuthGithub.login_url(%{scope: ["user:email"], state: referer})

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
