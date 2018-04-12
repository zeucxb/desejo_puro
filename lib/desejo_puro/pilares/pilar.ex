defmodule DesejoPuro.Pilares.Pilar do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesejoPuro.Pilares.Licao

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pilares" do
    field(:nome, :string)
    field(:icon, :string)
    has_many(:licoes, Licao)

    timestamps()
  end

  @doc false
  def changeset(pilar, attrs) do
    pilar
    |> cast(attrs, [:nome, :icon])
    |> validate_required([:nome, :icon])
  end
end
