defmodule DesejoPuro.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesejoPuro.Accounts.User
  alias DesejoPuro.ChangesetHelper

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:email, :string)
    field(:name, :string)
    field(:phone, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    field(:active, :boolean, default: true)

    timestamps()
  end

  @attrs ~w(active email name phone password)a
  def register_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
    |> apply_default_rules()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @attrs ++ [:password_hash])
    |> validate_required(@attrs ++ [:password_hash])
    |> apply_default_rules()
  end

  defp apply_default_rules(changeset) do
    changeset
    |> ChangesetHelper.validate_email()
    |> ChangesetHelper.validate_password()
    |> ChangesetHelper.put_pass_hash()
    |> unique_constraint(:email)
  end
end
