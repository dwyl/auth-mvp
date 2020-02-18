defmodule AuthMvp.Mock.ElixirAuthGithub do

  def login_url(%{scope: _scope, state: _state}) do
    "github oauth url"
  end

  def github_auth(_code) do
    profile = %{name: "simonLab"}
    {:ok, profile}
  end
end

