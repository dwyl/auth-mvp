defmodule AuthMvpWeb.PageController do
  use AuthMvpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
