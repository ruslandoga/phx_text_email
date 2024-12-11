defmodule Email.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EmailWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:email, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Email.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Email.Finch},
      # Start a worker by calling: Email.Worker.start_link(arg)
      # {Email.Worker, arg},
      # Start to serve requests, typically the last entry
      EmailWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Email.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EmailWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
