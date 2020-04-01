defmodule AuthMvpWeb.Router do
  use AuthMvpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :person do
    plug AuthMvp.Plugs.AuthenticatePerson
  end

  scope "/", AuthMvpWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/auth/urls", AuthUrlController, :login
  end

  # Other scopes may use custom stacks.
  scope "/", AuthMvpWeb do
    pipe_through :api

    get "/auth/google/callback", GoogleAuthController, :index
    get "/auth/github/callback", GithubAuthController, :index
  end

  scope "/", AuthMvpWeb do
    pipe_through :api
    pipe_through :person

    get "/person/info", PersonController, :index
  end

end
