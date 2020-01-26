defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Sequence.Stash, 123},
      {Sequence.Server, nil},
      {Sequence.StackStash, ["stack" , "for" , "the", "stack"]},
      {Sequence.Stack, nil}
    ]

    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
