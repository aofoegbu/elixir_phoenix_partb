defmodule Partb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PartbWeb.Telemetry,
      # Start the Ecto repository
      Partb.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Partb.PubSub},
      # Start Finch
      {Finch, name: Partb.Finch},
      # Start the Endpoint (http/https)
      PartbWeb.Endpoint
      # Start a worker by calling: Partb.Worker.start_link(arg)
      # {Partb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Partb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PartbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
