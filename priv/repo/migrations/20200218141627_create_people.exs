defmodule AuthMvp.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :email, :string
      add :verified, :boolean, default: false, null: false

      timestamps()
    end

  end
end
