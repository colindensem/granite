defmodule Granite.Clubs do
  @moduledoc """
  The Clubs context.
  """

  import Ecto.Query, warn: false
  alias Granite.Repo

  alias Granite.Clubs.Club

  @doc """
  Returns the list of clubs.

  ## Examples

      iex> list_clubs()
      [%Club{}, ...]

  """
  def list_clubs do
    Repo.all(Club, skip_club_id: true)
  end

  @doc """
  Gets a single club.

  Raises `Ecto.NoResultsError` if the Club does not exist.

  ## Examples

      iex> get_club!(123)
      %Club{}

      iex> get_club!(456)
      ** (Ecto.NoResultsError)

  """
  def get_club!(id),
    do: Repo.get!(Club, id, skip_club_id: true)

  @doc """
  Gets a single club by it's subdomain slug.

  Raises `Ecto.NoResultsError` if the Club does not exist.

  ## Examples

  iex> get_club_by_slug!("bond")
  %Club{}

  iex> get_club!("bourne")
  ** (Ecto.NoResultsError)

  """
  def get_club_by_slug!(slug) do
    # do: Repo.get_by!(Club, slug: slug, skip_club_id: true)
    query =
      from c in Club,
        where: c.slug == ^slug,
        # where: o.is_active == true,
        limit: 1

    # # Send the query to the repository
    Repo.one(query, skip_club_id: true)
  end

  @doc """
  Creates a club.

  ## Examples

      iex> create_club(%{field: value})
      {:ok, %Club{}}

      iex> create_club(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_club(attrs \\ %{}) do
    %Club{}
    |> Club.changeset(attrs)
    |> Repo.insert(skip_club_id: true)
  end

  @doc """
  Updates a club.

  ## Examples

      iex> update_club(club, %{field: new_value})
      {:ok, %Club{}}

      iex> update_club(club, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_club(%Club{} = club, attrs) do
    club
    |> Club.changeset(attrs)
    |> Repo.update(skip_club_id: true)
  end

  @doc """
  Deletes a club.

  ## Examples

      iex> delete_club(club)
      {:ok, %Club{}}

      iex> delete_club(club)
      {:error, %Ecto.Changeset{}}

  """
  def delete_club(%Club{} = club) do
    Repo.delete(club, skip_club_id: true)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking club changes.

  ## Examples

      iex> change_club(club)
      %Ecto.Changeset{data: %Club{}}

  """
  def change_club(%Club{} = club, attrs \\ %{}) do
    Club.changeset(club, attrs)
  end
end
