defmodule AuthMvpWeb.AuthUrlController do
  use AuthMvpWeb, :controller

  def index(conn, _params) do
    referer = get_referer(conn)
    google_url = ElixirAuthGoogle.generate_oauth_url(conn) <> "&state=#{referer}"
    github_url = ElixirAuthGithub.login_url(%{scope: ["user:email"], state: referer})

    urls = [%{url: google_url, type: "google"}, %{url: github_url, type: "github"}]
    render(conn, "index.json", urls: urls)
  end

  defp get_referer(conn) do
    case List.keyfind(conn.req_headers, "referer", 0) do
      {"referer", referer} ->
        referer
      nil ->
        nil
    end
  end
end
