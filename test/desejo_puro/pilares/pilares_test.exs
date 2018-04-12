defmodule DesejoPuro.PilaresTest do
  use DesejoPuro.DataCase

  alias DesejoPuro.Pilares

  describe "pilares" do
    alias DesejoPuro.Pilares.Pilar

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def pilar_fixture(attrs \\ %{}) do
      {:ok, pilar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pilares.create_pilar()

      pilar
    end

    test "list_pilares/0 returns all pilares" do
      pilar = pilar_fixture()
      assert Pilares.list_pilares() == [pilar]
    end

    test "get_pilar!/1 returns the pilar with given id" do
      pilar = pilar_fixture()
      assert Pilares.get_pilar!(pilar.id) == pilar
    end

    test "create_pilar/1 with valid data creates a pilar" do
      assert {:ok, %Pilar{} = pilar} = Pilares.create_pilar(@valid_attrs)
      assert pilar.nome == "some nome"
    end

    test "create_pilar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pilares.create_pilar(@invalid_attrs)
    end

    test "update_pilar/2 with valid data updates the pilar" do
      pilar = pilar_fixture()
      assert {:ok, pilar} = Pilares.update_pilar(pilar, @update_attrs)
      assert %Pilar{} = pilar
      assert pilar.nome == "some updated nome"
    end

    test "update_pilar/2 with invalid data returns error changeset" do
      pilar = pilar_fixture()
      assert {:error, %Ecto.Changeset{}} = Pilares.update_pilar(pilar, @invalid_attrs)
      assert pilar == Pilares.get_pilar!(pilar.id)
    end

    test "delete_pilar/1 deletes the pilar" do
      pilar = pilar_fixture()
      assert {:ok, %Pilar{}} = Pilares.delete_pilar(pilar)
      assert_raise Ecto.NoResultsError, fn -> Pilares.get_pilar!(pilar.id) end
    end

    test "change_pilar/1 returns a pilar changeset" do
      pilar = pilar_fixture()
      assert %Ecto.Changeset{} = Pilares.change_pilar(pilar)
    end
  end

  describe "licoes" do
    alias DesejoPuro.Pilares.Licao

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def licao_fixture(attrs \\ %{}) do
      {:ok, licao} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pilares.create_licao()

      licao
    end

    test "list_licoes/0 returns all licoes" do
      licao = licao_fixture()
      assert Pilares.list_licoes() == [licao]
    end

    test "get_licao!/1 returns the licao with given id" do
      licao = licao_fixture()
      assert Pilares.get_licao!(licao.id) == licao
    end

    test "create_licao/1 with valid data creates a licao" do
      assert {:ok, %Licao{} = licao} = Pilares.create_licao(@valid_attrs)
      assert licao.nome == "some nome"
    end

    test "create_licao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pilares.create_licao(@invalid_attrs)
    end

    test "update_licao/2 with valid data updates the licao" do
      licao = licao_fixture()
      assert {:ok, licao} = Pilares.update_licao(licao, @update_attrs)
      assert %Licao{} = licao
      assert licao.nome == "some updated nome"
    end

    test "update_licao/2 with invalid data returns error changeset" do
      licao = licao_fixture()
      assert {:error, %Ecto.Changeset{}} = Pilares.update_licao(licao, @invalid_attrs)
      assert licao == Pilares.get_licao!(licao.id)
    end

    test "delete_licao/1 deletes the licao" do
      licao = licao_fixture()
      assert {:ok, %Licao{}} = Pilares.delete_licao(licao)
      assert_raise Ecto.NoResultsError, fn -> Pilares.get_licao!(licao.id) end
    end

    test "change_licao/1 returns a licao changeset" do
      licao = licao_fixture()
      assert %Ecto.Changeset{} = Pilares.change_licao(licao)
    end
  end
end
