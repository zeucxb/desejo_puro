defmodule DesejoPuroWeb.AuthController do
  use DesejoPuroWeb, :controller

  alias DesejoPuro.Accounts
  alias Accounts.User
  alias DesejoPuro.Auth.Guardian

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end

  def login(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "login.html", changeset: changeset)
  end

  def login_action(conn, %{"email" => email, "password" => password}) do
    Accounts.login(email, password)
    |> login_reply(conn)
  end

  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "Bem vindo, #{user.name}!")
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/")
  end
end
