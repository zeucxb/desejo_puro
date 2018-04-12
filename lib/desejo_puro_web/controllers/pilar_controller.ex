defmodule DesejoPuroWeb.PilarController do
  use DesejoPuroWeb, :controller

  alias DesejoPuro.Pilares
  alias DesejoPuro.Pilares.Pilar

  def index(conn, _params) do
    pilares = Pilares.list_pilares()
    render(conn, "index.html", pilares: pilares)
  end

  def new(conn, _params) do
    changeset = Pilares.change_pilar(%Pilar{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pilar" => pilar_params}) do
    case Pilares.create_pilar(pilar_params) do
      {:ok, pilar} ->
        conn
        |> put_flash(:info, "Pilar created successfully.")
        |> redirect(to: pilar_path(conn, :show, pilar))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pilar = Pilares.get_pilar!(id)
    render(conn, "show.html", pilar: pilar)
  end

  def edit(conn, %{"id" => id}) do
    pilar = Pilares.get_pilar!(id)
    changeset = Pilares.change_pilar(pilar)
    render(conn, "edit.html", pilar: pilar, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pilar" => pilar_params}) do
    pilar = Pilares.get_pilar!(id)

    case Pilares.update_pilar(pilar, pilar_params) do
      {:ok, pilar} ->
        conn
        |> put_flash(:info, "Pilar updated successfully.")
        |> redirect(to: pilar_path(conn, :show, pilar))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pilar: pilar, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pilar = Pilares.get_pilar!(id)
    {:ok, _pilar} = Pilares.delete_pilar(pilar)

    conn
    |> put_flash(:info, "Pilar deleted successfully.")
    |> redirect(to: pilar_path(conn, :index))
  end
end
