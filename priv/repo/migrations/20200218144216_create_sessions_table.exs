defmodule AuthMvp.Repo.Migrations.CreateSessionsTable do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :valid, :boolean

      # keep sessions when user is deleted
      add :person_id, references(:people, on_delete: :nothing)
      timestamps()
    end
  end
end
