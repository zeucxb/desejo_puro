defmodule DesejoPuro.Repo.Migrations.AddUserCellphone do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:phone, :string)
    end
  end
end
