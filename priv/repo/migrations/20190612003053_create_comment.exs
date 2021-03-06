defmodule Amrita.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :message, :string

      timestamps()
    end
  end
end
