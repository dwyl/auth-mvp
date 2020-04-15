defmodule AuthMvpWeb.GithubAuthController do
  use AuthMvpWeb, :controller

  @doc """
  `index/2` handles the callback from GitHub Auth API redirect.
  """
  def index(conn, %{"code" => code, "state" => client}) do
    {:ok, profile} = ElixirAuthGithub.github_auth(code)

    {:ok, session} =
      case AuthMvp.People.get_person_by_email(profile.email) do
        nil ->
          {:ok, person} =
            AuthMvp.People.create_person(%{email: profile.email, avatar: profile.avatar_url})

          # AuthMvp.Email.sendemail(%{email: profile.email, template: "welcome"})
          AuthMvp.People.create_session(person)

        person ->
          {:ok, p} = AuthMvp.People.update_person(person, %{avatar: profile.avatar_url})
          AuthMvp.People.create_session(p)
      end

    person = AuthMvp.People.get_person_by_email(profile.email)

    jwt =
      AuthMvp.Token.generate_and_sign!(%{
        email: person.email,
        session: session.id,
        avatar: person.avatar
      })

    redirect(conn, external: "#{client}?jwt=#{jwt}")
  end
end
