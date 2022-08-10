defmodule Granite.Factory do
  use ExMachina.Ecto, repo: Granite.Repo

  alias Granite.Clubs.Club

  def club_factory(attrs) do
    slug = attrs[:slug] || sequence(:slug, &"granite-club-#{&1}")

    club = %Club{
      contact_email: sequence(:email, &"granite-#{&1}@example.com"),
      contact_name: "Granite Club",
      name: "Granite Club",
      slug: slug
    }

    merge_attributes(club, attrs)
  end
end
