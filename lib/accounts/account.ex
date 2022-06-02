defmodule Account do
  use GenServer

  # {:ok, pid} = Account.start_link
  # or
  # {:ok, pid} = GenServer.start_link(Account, %{})

  # GenServer.call(pid, :data)

  # @impl true -> means that is a callback

  @impl true
  def init(initial_state) do
    # send(self(), :start_account)

    # continue will do the same then send
    {:ok, initial_state, {:continue, :start_account}}
  end

  def start_link(state \\ %{}), do: GenServer.start_link(__MODULE__, state)

  @impl true
  def handle_info(:start_account, state) do
    {:noreply, start(state)}
  end

  @impl true
  def handle_continue(:start_account, state) do
    {:noreply, start(state)}
  end

  defp start(state) do
    Process.sleep(5_000)

    Map.put(state, :started, DateTime.utc_now())
  end

  # sync
  @impl true
  def handle_call(:data, _from, state) do
    {:reply, state, state}
  end

  # async
  @impl true
  def handle_cast({:purchase, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end
end
