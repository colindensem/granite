# Always create one master tenant club record.
Granite.Clubs.create_club(%{
  contact_email: "clubalpha@example.com",
  contact_name: "Alpha Secretary",
  name: "Club Alpha",
  slug: "club-alpha",
  is_active: true
})

{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.configure(formatters: [ExUnit.CLIFormatter, ExUnitNotifier])

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Granite.Repo, :manual)
