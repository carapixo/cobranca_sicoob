defmodule CobrancaSicoob.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CobrancaSicoob.Repo,
      # Start the Telemetry supervisor
      CobrancaSicoobWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CobrancaSicoob.PubSub},
      # Start the Endpoint (http/https)
      CobrancaSicoobWeb.Endpoint
      # Start a worker by calling: CobrancaSicoob.Worker.start_link(arg)
      # {CobrancaSicoob.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CobrancaSicoob.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CobrancaSicoobWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
