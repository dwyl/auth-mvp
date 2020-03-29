defmodule AuthMvpWeb.GoogleAuthController do
  use AuthMvpWeb, :controller

  @elixir_auth_google Application.get_env(:auth_mvp, :elixir_auth_google) || ElixirAuthGoogle

  @doc """
  `index/2` handles the callback from Google Auth API redirect.
  """
  def index(conn, %{"code" => code} = params) do
    {:ok, token} = @elixir_auth_google.get_token(code, conn)
    {:ok, profile} = @elixir_auth_google.get_user_profile(token.access_token)

    # get the person by email
    {:ok, session} = case AuthMvp.People.get_person_by_email(profile.email) do
      nil ->
        # Create the person
        {:ok, person} = AuthMvp.People.create_person(%{email: profile.email})
        AuthMvp.Email.sendemail(%{email: profile.email, template: "welcome"})
        AuthMvp.People.create_session(person)

      person ->
        AuthMvp.People.create_session(person)
    end

    jwt = AuthMvp.Token.generate_and_sign!(%{email: profile.email, session: session.id })
    redirect(conn, external: "#{params["state"]}?jwt=#{jwt}")
  end

end
