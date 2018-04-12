defmodule DesejoPuro.ChangesetHelper do
  import Ecto.Changeset
  import Comeonin.Pbkdf2, only: [add_hash: 1]

  def validate_email(changeset) do
    changeset
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
  end

  def validate_password(changeset) do
    changeset
    |> validate_length(:password, min: 8)
    |> validate_format(
      :password,
      ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/,
      message: "Must include at least one lowercase letter, one uppercase letter, and one digit"
    )
  end

  def put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset),
    do: change(changeset, add_hash(password))

  def put_pass_hash(changeset), do: changeset

  def put_assocs(changeset, []), do: changeset

  def put_assocs(changeset, [{name, assoc} | assocs]) do
    changeset
    |> Ecto.Changeset.put_assoc(name, assoc)
    |> put_assocs(assocs)
  end

  def changeset_string_error(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    |> Enum.reduce("", fn {label, message}, final_message ->
      final_message <> "#{label}: #{message}, "
    end)
    |> String.trim(", ")
  end

  defp translate_error({msg, opts}) do
    # Because error messages were defined within Ecto, we must
    # call the Gettext module passing our Gettext backend. We
    # also use the "errors" domain as translations are placed
    # in the errors.po file.
    # Ecto will pass the :count keyword if the error message is
    # meant to be pluralized.
    # On your own code and templates, depending on whether you
    # need the message to be pluralized or not, this could be
    # written simply as:
    #
    #     dngettext "errors", "1 file", "%{count} files", count
    #     dgettext "errors", "is invalid"
    #
    if count = opts[:count] do
      Gettext.dngettext(SocialMemoriesWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(SocialMemoriesWeb.Gettext, "errors", msg, opts)
    end
  end
end
