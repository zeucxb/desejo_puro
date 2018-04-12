defmodule DesejoPuroWeb.LicaoController do
  use DesejoPuroWeb, :controller

  alias DesejoPuro.Pilares
  alias DesejoPuro.Pilares.Licao

  def index(conn, _params) do
    licoes = Pilares.list_licoes()
    render(conn, "index.html", licoes: licoes)
  end

  def new(conn, _params) do
    changeset = Pilares.change_licao(%Licao{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"licao" => licao_params}) do
    case Pilares.create_licao(licao_params["pilar_id"], licao_params) do
      {:ok, licao} ->
        conn
        |> put_flash(:info, "Licao created successfully.")
        |> redirect(to: licao_path(conn, :show, licao))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    licao = Pilares.get_licao!(id)
    render(conn, "show.html", licao: licao)
  end

  def edit(conn, %{"id" => id}) do
    licao = Pilares.get_licao!(id)
    changeset = Pilares.change_licao(licao)
    render(conn, "edit.html", licao: licao, changeset: changeset)
  end

  def update(conn, %{"id" => id, "licao" => licao_params}) do
    licao = Pilares.get_licao!(id)

    case Pilares.update_licao(licao, licao_params) do
      {:ok, licao} ->
        conn
        |> put_flash(:info, "Licao updated successfully.")
        |> redirect(to: licao_path(conn, :show, licao))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", licao: licao, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    licao = Pilares.get_licao!(id)
    {:ok, _licao} = Pilares.delete_licao(licao)

    conn
    |> put_flash(:info, "Licao deleted successfully.")
    |> redirect(to: licao_path(conn, :index))
  end
end
