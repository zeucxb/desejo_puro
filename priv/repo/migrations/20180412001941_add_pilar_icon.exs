defmodule DesejoPuro.Repo.Migrations.AddPilarIcon do
  use Ecto.Migration

  def change do
    alter table("pilares") do
      add(:icon, :string)
    end
  end
end
