defmodule DesejoPuroWeb.PilarControllerTest do
  use DesejoPuroWeb.ConnCase

  alias DesejoPuro.Pilares

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:pilar) do
    {:ok, pilar} = Pilares.create_pilar(@create_attrs)
    pilar
  end

  describe "index" do
    test "lists all pilares", %{conn: conn} do
      conn = get conn, pilar_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Pilares"
    end
  end

  describe "new pilar" do
    test "renders form", %{conn: conn} do
      conn = get conn, pilar_path(conn, :new)
      assert html_response(conn, 200) =~ "New Pilar"
    end
  end

  describe "create pilar" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, pilar_path(conn, :create), pilar: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == pilar_path(conn, :show, id)

      conn = get conn, pilar_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Pilar"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pilar_path(conn, :create), pilar: @invalid_attrs
      assert html_response(conn, 200) =~ "New Pilar"
    end
  end

  describe "edit pilar" do
    setup [:create_pilar]

    test "renders form for editing chosen pilar", %{conn: conn, pilar: pilar} do
      conn = get conn, pilar_path(conn, :edit, pilar)
      assert html_response(conn, 200) =~ "Edit Pilar"
    end
  end

  describe "update pilar" do
    setup [:create_pilar]

    test "redirects when data is valid", %{conn: conn, pilar: pilar} do
      conn = put conn, pilar_path(conn, :update, pilar), pilar: @update_attrs
      assert redirected_to(conn) == pilar_path(conn, :show, pilar)

      conn = get conn, pilar_path(conn, :show, pilar)
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, pilar: pilar} do
      conn = put conn, pilar_path(conn, :update, pilar), pilar: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Pilar"
    end
  end

  describe "delete pilar" do
    setup [:create_pilar]

    test "deletes chosen pilar", %{conn: conn, pilar: pilar} do
      conn = delete conn, pilar_path(conn, :delete, pilar)
      assert redirected_to(conn) == pilar_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, pilar_path(conn, :show, pilar)
      end
    end
  end

  defp create_pilar(_) do
    pilar = fixture(:pilar)
    {:ok, pilar: pilar}
  end
end
