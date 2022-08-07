defmodule Granite.Clubs.ClubTest do
  use Granite.DataCase

  alias Granite.Repo
  alias Granite.Clubs.Club

  describe "schema validation" do
    test "changeset is invalid if not an email" do
      changeset = Club.changeset(%Club{}, %{contact_email: "not an email"})
      assert %{contact_email: ["has invalid format"]} = errors_on(changeset)
    end

    test "changeset requires th following" do
      changeset = Club.changeset(%Club{}, %{})
      assert %{contact_email: ["can't be blank"]} = errors_on(changeset)
      assert %{contact_name: ["can't be blank"]} = errors_on(changeset)
      assert %{name: ["can't be blank"]} = errors_on(changeset)
      assert %{slug: ["can't be blank"]} = errors_on(changeset)
    end

    test "name must be less than 120 chars" do
      changeset = Club.changeset(%Club{}, %{name: String.duplicate("a", 121)})

      assert %{name: ["should be at most 120 character(s)"]} =
               errors_on(changeset)
    end

    test "name must be at least 3 chars" do
      changeset = Club.changeset(%Club{}, %{name: "a"})

      assert %{name: ["should be at least 3 character(s)"]} =
               errors_on(changeset)
    end

    test "contact_name must be less than 120 chars" do
      changeset =
        Club.changeset(%Club{}, %{contact_name: String.duplicate("a", 121)})

      assert %{contact_name: ["should be at most 120 character(s)"]} =
               errors_on(changeset)
    end

    test "contact_name must be at least 3 chars" do
      changeset = Club.changeset(%Club{}, %{contact_name: "a"})

      assert %{contact_name: ["should be at least 3 character(s)"]} =
               errors_on(changeset)
    end

    test "slug must be less than 30 chars" do
      changeset = Club.changeset(%Club{}, %{slug: String.duplicate("a", 121)})

      assert %{slug: ["should be at most 30 character(s)"]} =
               errors_on(changeset)
    end

    test "slug must be at least 3 chars" do
      changeset = Club.changeset(%Club{}, %{slug: "a"})

      assert %{slug: ["should be at least 3 character(s)"]} =
               errors_on(changeset)
    end

    test "formats slug correctly" do
      changeset = Club.changeset(%Club{}, %{slug: "1-my club rocks"})

      assert Ecto.Changeset.get_field(changeset, :slug) == "1-my-club-rocks"
    end
  end
end
