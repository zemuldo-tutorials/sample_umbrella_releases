defmodule App1.Application do
  use Application

  def start(_type, _args) do
    children = [ {App1, []}]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
