defmodule DesejoPuro.Pilares.Licao do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesejoPuro.Pilares.Pilar

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "licoes" do
    field(:nome, :string)
    belongs_to(:pilar, Pilar)

    timestamps()
  end

  @doc false
  def changeset(licao, attrs) do
    licao
    |> cast(attrs, [:nome, :pilar_id])
    |> validate_required([:nome, :pilar_id])
    |> foreign_key_constraint(:pilar_id)
  end
end
