defmodule AuthMvp.People.Person do
  @moduledoc """
  Schema for people.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :email, :string
    field :verified, :boolean, default: false
    field :avatar, :string

    has_many :sessions, AuthMvp.People.Session
    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:email, :verified, :avatar])
    |> validate_required([:email, :verified, :avatar])
  end
end
