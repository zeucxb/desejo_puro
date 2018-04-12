# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :desejo_puro,
  ecto_repos: [DesejoPuro.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :desejo_puro, DesejoPuroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SajMhW8+3slemO9ffgDesEOdf4yIRhj1G18t6PwPbGFbNDo5JfqUM2AhY83HCcJF",
  render_errors: [view: DesejoPuroWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DesejoPuro.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian configs
config :desejo_puro, DesejoPuro.Auth.Guardian,
  issuer: "D3S3J0pUr0",
  secret_key: "UbP7CF2fAmpO2GLu2nQoZPpA+G2OLBOlxjPNQeiDY7XVZ1+ADPU7+2Xp/Ao2gLU/"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
