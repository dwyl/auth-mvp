defmodule AuthMvp.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :email, :string
    field :verified, :boolean, default: false

    has_many :sessions, AuthMvp.People.Session
    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:email, :verified])
    |> validate_required([:email, :verified])
  end
end
