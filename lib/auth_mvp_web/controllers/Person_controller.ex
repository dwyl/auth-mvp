defmodule AuthMvpWeb.PersonController do
  use AuthMvpWeb, :controller

  def index(conn, _params) do
    person = AuthMvp.People.get_person_by_email(conn.assigns.claims.email)

    render(conn, "index.json", person: %{email: person.email})
  end

end
