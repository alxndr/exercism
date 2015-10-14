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
    {:ok, pid} = Agent.start(fn -> 0 end)
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(pid) do
    :ok = Agent.stop(pid)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(pid) do
    Agent.get(pid, &(&1))
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(pid, amount) do
    Agent.update(pid, &(amount + &1))
  end
end
