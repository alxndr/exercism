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
    spawn fn ->
      loop(%{balance: 0})
    end
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(_account) do
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send account, {:balance, self}
    receive do
      balance -> balance
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send account, {:update, amount, self}
    receive do
      _ -> true
    end
  end

  @spec loop(%{}) :: nil # ...?
  defp loop(ledger) do
    receive do
      {:balance, caller} ->
        send caller, ledger.balance
        loop ledger
      {:update, amount, caller} ->
        ledger = %{ledger | balance: ledger.balance + amount}
        send caller, ledger.balance
        loop ledger
    end
  end
end
