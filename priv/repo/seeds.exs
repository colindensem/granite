# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Granite.Repo.insert!(%Granite.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Granite.Clubs.create_club(%{
  contact_email: "clubalpha@example.com",
  contact_name: "Alpha Secretary",
  name: "Club Alpha",
  slug: "club-a",
  is_active: true
})

Granite.Clubs.create_club(%{
  contact_email: "clubbravo@example.com",
  contact_name: "Bravo Secretary",
  name: "Club Bravo",
  slug: "club-b",
  is_active: true
})
