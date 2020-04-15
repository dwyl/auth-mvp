defmodule AuthMvpWeb.GoogleAuthController do
  use AuthMvpWeb, :controller

  @doc """
  `index/2` handles the callback from Google Auth API redirect.
  """
  def index(conn, %{"code" => code} = params) do
    {:ok, token} = ElixirAuthGoogle.get_token(code, conn)
    {:ok, profile} = ElixirAuthGoogle.get_user_profile(token.access_token)
    # get the person by email
    {:ok, session} =
      case AuthMvp.People.get_person_by_email(profile.email) do
        nil ->
          # Create the person
          {:ok, person} =
            AuthMvp.People.create_person(%{email: profile.email, avatar: profile.picture})

          # AuthMvp.Email.sendemail(%{email: profile.email, template: "welcome"})
          AuthMvp.People.create_session(person)

        person ->
          {:ok, p} = AuthMvp.People.update_person(person, %{avatar: profile.picture})
          AuthMvp.People.create_session(p)
      end

    person = AuthMvp.People.get_person_by_email(profile.email)

    jwt =
      AuthMvp.Token.generate_and_sign!(%{
        email: person.email,
        session: session.id,
        avatar: person.avatar
      })

    redirect(conn, external: "#{params["state"]}?jwt=#{jwt}")
  end
end
