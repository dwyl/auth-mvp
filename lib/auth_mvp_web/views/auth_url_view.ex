defmodule AuthMvpWeb.AuthUrlView do
  use AuthMvpWeb, :view

  def render("index.json", %{urls: urls}) do
    %{data: urls}
  end

end
