defmodule DesejoPuro.Repo.Migrations.CreatePilares do
  use Ecto.Migration

  def change do
    create table(:pilares, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nome, :string

      timestamps()
    end

  end
end
