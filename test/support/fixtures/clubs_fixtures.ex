defmodule Granite.ClubsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Granite.Clubs` context.
  """

  @doc """
  Generate a club.
  """
  def club_fixture(attrs \\ %{}) do
    {:ok, club} =
      attrs
      |> Enum.into(%{
        contact_email: "cluba@example.com",
        contact_name: "someone",
        is_active: true,
        name: "some name",
        slug: "some slug"
      })
      |> Granite.Clubs.create_club()

    club
  end
end
