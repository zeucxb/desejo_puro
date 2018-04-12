defmodule DesejoPuro.Repo.Migrations.ChangeUsersStructure do
  use Ecto.Migration

  def change do
    alter table("users") do
      add(:active, :boolean)
      add(:password_hash, :string)
      remove(:password)
    end
  end
end
