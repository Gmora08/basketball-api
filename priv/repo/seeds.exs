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

# Leagues
Basketball.Repo.insert!(%Basketball.BdSchemas.League{acronym: "NBA", foundation: Date.from_iso8601!("1964-06-06"), name: "National Basketball League"})
Basketball.Repo.insert!(%Basketball.BdSchemas.League{acronym: "LNBP", foundation: Date.from_iso8601!("2000-03-11"), name: "Liga Nacional de Baloncesto Profesional"})
Basketball.Repo.insert!(%Basketball.BdSchemas.League{acronym: "ACB", foundation: Date.from_iso8601!("1983-09-11"), name: "Asociacion de Clubs de Baloncesto"})

# Teams
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 1, city: "Boston", foundation: Date.from_iso8601!("1964-09-07"), logo: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8f/Boston_Celtics.svg/400px-Boston_Celtics.svg.png", name: "Celtics"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 1, city: "LA", foundation: Date.from_iso8601!("1947-09-07"), logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Los_Angeles_Lakers_logo.svg/440px-Los_Angeles_Lakers_logo.svg.png", name: "Lakers"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 1, city: "Brooklyn", foundation: Date.from_iso8601!("1967-09-07"), logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Brooklyn_Nets_newlogo.svg/300px-Brooklyn_Nets_newlogo.svg.png", name: "Nets"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 2, city: "Mexico City", foundation: Date.from_iso8601!("2017-02-10"), logo: "https://upload.wikimedia.org/wikipedia/en/thumb/2/2d/Capitanes_de_Ciudad_de_M%C3%A9xico_logo.svg/500px-Capitanes_de_Ciudad_de_M%C3%A9xico_logo.svg.png", name: "Capitanes"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 2, city: "Monterrey", foundation: Date.from_iso8601!("2001-03-07"), logo: "https://upload.wikimedia.org/wikipedia/en/7/75/Fuerza_Regia_2015_Logo.png", name: "Fuerza Regia"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 2, city: "Jalisco", foundation: Date.from_iso8601!("2019-01-07"), logo: "https://upload.wikimedia.org/wikipedia/en/1/17/Astros_de_Jalisco_logo.png", name: "Astros"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 3, city: "Barcelona", foundation: Date.from_iso8601!("1926-08-24"), logo: "https://upload.wikimedia.org/wikipedia/en/thumb/1/19/FC_Barcelona_B%C3%A0squet_logo.svg/300px-FC_Barcelona_B%C3%A0squet_logo.svg.png", name: "Barca"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 3, city: "Madrid", foundation: Date.from_iso8601!("1931-03-08"), logo: "https://upload.wikimedia.org/wikipedia/en/thumb/c/cd/Real_Madrid_Baloncesto_logo.svg/300px-Real_Madrid_Baloncesto_logo.svg.png", name: "Real Madrid"})
Basketball.Repo.insert!(%Basketball.BdSchemas.Team{league_id: 3, city: "Vitoria-Gasteiz", foundation: Date.from_iso8601!("1959-12-26"), logo: "https://upload.wikimedia.org/wikipedia/en/6/6a/Saski_Baskonia.png", name: "Baskonia"})
