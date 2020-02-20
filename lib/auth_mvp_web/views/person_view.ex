defmodule AuthMvpWeb.PersonView do
  use AuthMvpWeb, :view

  def render("index.json", %{person: person}) do
    %{data: person}
  end

end
