defmodule AuthMvp.People.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :valid, :boolean, default: true

    belongs_to :person, AuthMvp.People.Person
    timestamps()
  end

  def changeset(people, attrs) do
    Ecto.build_assoc(people, :sessions)
    |> cast(attrs, [:valid])
  end

end
