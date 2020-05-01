defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _initial_number) do
    children = [
      {Sequence.Stash, nil},
      {Sequence.Server, nil}
      # {Sequence.StackStash, Application.get_env(:sequence, :inital_stack)},
      # {Sequence.Stack, nil}
    ]

    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
