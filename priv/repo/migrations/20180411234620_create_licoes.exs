defmodule DesejoPuro.Repo.Migrations.CreateLicoes do
  use Ecto.Migration

  def change do
    create table(:licoes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nome, :string
      add :pilar_id, references(:pilares, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:licoes, [:pilar_id])
  end
end
