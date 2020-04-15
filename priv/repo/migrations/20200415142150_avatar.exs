defmodule AuthMvp.Repo.Migrations.Avatar do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :avatar, :text
    end
  end
end
