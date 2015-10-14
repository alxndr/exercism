defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    BalanceAgent.new
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    BalanceAgent.close(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    BalanceAgent.get(account)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    BalanceAgent.add(account, amount)
  end
end

defmodule BalanceAgent do
  def new do
    {:ok, pid} = Agent.start(fn -> 0 end)
    pid
  end

  def get(pid) do
    Agent.get(pid, fn (balance) -> balance end)
  end

  def add(pid, amount) do
    Agent.update(pid, fn (balance) -> balance + amount end)
  end

  def close(pid) do
    :ok = Agent.stop(pid)
  end
end
