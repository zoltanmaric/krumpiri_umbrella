defmodule Krumpiri.Application do
  @moduledoc """
  The Krumpiri Application Service.

  The krumpiri system business domain lives in this application.

  Exposes API to clients such as the `KrumpiriWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Krumpiri.Repo, []),
    ], strategy: :one_for_one, name: Krumpiri.Supervisor)
  end
end
