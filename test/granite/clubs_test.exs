defmodule Granite.ClubsTest do
  use Granite.DataCase

  alias Granite.Clubs

  describe "clubs" do
    alias Granite.Clubs.Club

    @invalid_attrs %{
      contact_email: nil,
      contact_name: nil,
      is_active: nil,
      name: nil,
      slug: nil
    }

    test "list_clubs/0 returns all clubs" do
      club = insert(:club)
      assert Clubs.list_clubs() == [club]
    end

    test "get_club!/1 returns the club with given id" do
      club = insert(:club)
      assert Clubs.get_club!(club.club_id) == club
    end

    test "create_club/1 with valid data creates a club" do
      valid_attrs = %{
        contact_email: "cluba@example.com",
        contact_name: "someone",
        is_active: true,
        name: "some name",
        slug: "some slug"
      }

      assert {:ok, %Club{} = club} = Clubs.create_club(valid_attrs)
      assert club.contact_email == "cluba@example.com"
      assert club.contact_name == "someone"
      assert club.is_active == true
      assert club.name == "some name"
      assert club.slug == "some-slug"
    end

    test "create_club/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clubs.create_club(@invalid_attrs)
    end

    test "update_club/2 with valid data updates the club" do
      club = insert(:club)

      update_attrs = %{
        contact_email: "cluba1@example.com",
        contact_name: "someone new",
        is_active: false,
        name: "some updated name",
        slug: "some-updated-slug"
      }

      assert {:ok, %Club{} = club} = Clubs.update_club(club, update_attrs)
      assert club.contact_email == "cluba1@example.com"
      assert club.contact_name == "someone new"
      assert club.is_active == false
      assert club.name == "some updated name"
      assert club.slug == "some-updated-slug"
    end

    test "update_club/2 with invalid data returns error changeset" do
      club = insert(:club)

      assert {:error, %Ecto.Changeset{}} =
               Clubs.update_club(club, @invalid_attrs)

      assert club == Clubs.get_club!(club.club_id)
    end

    test "delete_club/1 deletes the club" do
      club = insert(:club)
      assert {:ok, %Club{}} = Clubs.delete_club(club)
      assert_raise Ecto.NoResultsError, fn -> Clubs.get_club!(club.club_id) end
    end

    test "change_club/1 returns a club changeset" do
      club = insert(:club)
      assert %Ecto.Changeset{} = Clubs.change_club(club)
    end
  end
end
