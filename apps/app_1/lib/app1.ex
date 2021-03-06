defmodule App1 do
 use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    Process.send_after(self(), :update, 1000)
    {:ok, DateTime.utc_now()}
  end

  @impl true
  def handle_call(:get, _from, current_time) do
    {:reply, current_time, current_time}
  end

  @impl true
  def handle_info(:update, _state) do
    Process.send_after(self(), :update, 1000)
    {:noreply, DateTime.utc_now()} |> IO.inspect(label: "App 1")
  end

  def ge_current_date() do
    GenServer.call(__MODULE__, :get)
  end
end
