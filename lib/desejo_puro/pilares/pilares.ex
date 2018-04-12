defmodule DesejoPuro.Pilares do
  @moduledoc """
  The Pilares context.
  """

  import Ecto.Query, warn: false
  alias DesejoPuro.Repo

  alias DesejoPuro.Pilares.{Pilar, Licao}

  @doc """
  Returns the list of pilares.

  ## Examples

      iex> list_pilares()
      [%Pilar{}, ...]

  """
  def list_pilares do
    licao_query = from(l in Licao, order_by: l.inserted_at)

    pilar_query =
      from(
        p in Pilar,
        order_by: p.inserted_at,
        preload: [licoes: ^licao_query]
      )

    Repo.all(pilar_query)
  end

  @doc """
  Gets a single pilar.

  Raises `Ecto.NoResultsError` if the Pilar does not exist.

  ## Examples

      iex> get_pilar!(123)
      %Pilar{}

      iex> get_pilar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pilar!(id), do: Repo.get!(Pilar, id)

  @doc """
  Creates a pilar.

  ## Examples

      iex> create_pilar(%{field: value})
      {:ok, %Pilar{}}

      iex> create_pilar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pilar(attrs \\ %{}) do
    %Pilar{}
    |> Pilar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pilar.

  ## Examples

      iex> update_pilar(pilar, %{field: new_value})
      {:ok, %Pilar{}}

      iex> update_pilar(pilar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pilar(%Pilar{} = pilar, attrs) do
    pilar
    |> Pilar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pilar.

  ## Examples

      iex> delete_pilar(pilar)
      {:ok, %Pilar{}}

      iex> delete_pilar(pilar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pilar(%Pilar{} = pilar) do
    Repo.delete(pilar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pilar changes.

  ## Examples

      iex> change_pilar(pilar)
      %Ecto.Changeset{source: %Pilar{}}

  """
  def change_pilar(%Pilar{} = pilar) do
    Pilar.changeset(pilar, %{})
  end

  @doc """
  Returns the list of licoes.

  ## Examples

      iex> list_licoes()
      [%Licao{}, ...]

  """
  def list_licoes do
    Repo.all(Licao)
  end

  @doc """
  Gets a single licao.

  Raises `Ecto.NoResultsError` if the Licao does not exist.

  ## Examples

      iex> get_licao!(123)
      %Licao{}

      iex> get_licao!(456)
      ** (Ecto.NoResultsError)

  """
  def get_licao!(id), do: Repo.get!(Licao, id)

  @doc """
  Creates a licao.

  ## Examples

      iex> create_licao(%{field: value})
      {:ok, %Licao{}}

      iex> create_licao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_licao(pilar_id, attrs \\ %{}) do
    pilar = get_pilar!(pilar_id)

    pilar
    |> Ecto.build_assoc(:licoes)
    |> Licao.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a licao.

  ## Examples

      iex> update_licao(licao, %{field: new_value})
      {:ok, %Licao{}}

      iex> update_licao(licao, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_licao(%Licao{} = licao, attrs) do
    licao
    |> Licao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Licao.

  ## Examples

      iex> delete_licao(licao)
      {:ok, %Licao{}}

      iex> delete_licao(licao)
      {:error, %Ecto.Changeset{}}

  """
  def delete_licao(%Licao{} = licao) do
    Repo.delete(licao)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking licao changes.

  ## Examples

      iex> change_licao(licao)
      %Ecto.Changeset{source: %Licao{}}

  """
  def change_licao(%Licao{} = licao) do
    Licao.changeset(licao, %{})
  end
end
