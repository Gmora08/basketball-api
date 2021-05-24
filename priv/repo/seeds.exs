# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Basketball.Repo.insert!(%Basketball.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Basketball.Repo.insert!(%Basketball.BdSchemas.League{acronym: "NBA", foundation: Date.from_iso8601!("1964-06-06"), name: "National Basketball League"})
Basketball.Repo.insert!(%Basketball.BdSchemas.League{acronym: "LNBP", foundation: Date.from_iso8601!("2000-03-11"), name: "Liga Nacional de Baloncesto Profesional"})
