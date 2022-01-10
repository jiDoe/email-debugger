# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :email_debugger,
  ecto_repos: [EmailDebugger.Repo]

# Configures the endpoint
config :email_debugger, EmailDebuggerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DmdLYbu3VaNCw8UPD1BBg89nCXYhWmOglOFsZg8g+ORgHajOYYOB5qzkTkp+4LBg",
  render_errors: [view: EmailDebuggerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EmailDebugger.PubSub,
  live_view: [signing_salt: "TXonFzHT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
