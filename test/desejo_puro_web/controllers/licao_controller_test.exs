defmodule DesejoPuroWeb.LicaoControllerTest do
  use DesejoPuroWeb.ConnCase

  alias DesejoPuro.Pilares

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:licao) do
    {:ok, licao} = Pilares.create_licao(@create_attrs)
    licao
  end

  describe "index" do
    test "lists all licoes", %{conn: conn} do
      conn = get conn, licao_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Licoes"
    end
  end

  describe "new licao" do
    test "renders form", %{conn: conn} do
      conn = get conn, licao_path(conn, :new)
      assert html_response(conn, 200) =~ "New Licao"
    end
  end

  describe "create licao" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, licao_path(conn, :create), licao: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == licao_path(conn, :show, id)

      conn = get conn, licao_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Licao"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, licao_path(conn, :create), licao: @invalid_attrs
      assert html_response(conn, 200) =~ "New Licao"
    end
  end

  describe "edit licao" do
    setup [:create_licao]

    test "renders form for editing chosen licao", %{conn: conn, licao: licao} do
      conn = get conn, licao_path(conn, :edit, licao)
      assert html_response(conn, 200) =~ "Edit Licao"
    end
  end

  describe "update licao" do
    setup [:create_licao]

    test "redirects when data is valid", %{conn: conn, licao: licao} do
      conn = put conn, licao_path(conn, :update, licao), licao: @update_attrs
      assert redirected_to(conn) == licao_path(conn, :show, licao)

      conn = get conn, licao_path(conn, :show, licao)
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, licao: licao} do
      conn = put conn, licao_path(conn, :update, licao), licao: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Licao"
    end
  end

  describe "delete licao" do
    setup [:create_licao]

    test "deletes chosen licao", %{conn: conn, licao: licao} do
      conn = delete conn, licao_path(conn, :delete, licao)
      assert redirected_to(conn) == licao_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, licao_path(conn, :show, licao)
      end
    end
  end

  defp create_licao(_) do
    licao = fixture(:licao)
    {:ok, licao: licao}
  end
end
