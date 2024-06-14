defmodule LiveEvents.Repo do
  use Ecto.Repo,
    otp_app: :live_events,
    adapter: Ecto.Adapters.Postgres
end
