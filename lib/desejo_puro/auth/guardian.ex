defmodule DesejoPuro.Auth.Guardian do
  use Guardian, otp_app: :desejo_puro

  alias DesejoPuro.Repo
  alias DesejoPuro.Accounts.User

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def resource_from_claims(claims) do
    user = Repo.get!(User, claims["sub"])
    {:ok, user}
  end
end
