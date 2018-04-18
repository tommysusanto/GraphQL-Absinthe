use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :graphqlabsinthe, GraphqlabsintheWeb.Endpoint,
  secret_key_base: "4tZzehqsxv/MFIL1RqjfAalmSa42piiZf0YnoeCMW9lIO+nD8t8XyUqlpm8krsTe"

# Configure your database
config :graphqlabsinthe, Graphqlabsinthe.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "graphqlabsinthe_prod",
  pool_size: 15
