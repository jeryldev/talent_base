defmodule TalentBase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TalentBaseWeb.Telemetry,
      TalentBase.Repo,
      {DNSCluster, query: Application.get_env(:talent_base, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TalentBase.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TalentBase.Finch},
      # Start a worker by calling: TalentBase.Worker.start_link(arg)
      # {TalentBase.Worker, arg},
      # Start to serve requests, typically the last entry
      TalentBaseWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TalentBase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TalentBaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
