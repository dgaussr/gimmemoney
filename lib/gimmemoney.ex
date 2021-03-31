defmodule Gimmemoney do
  alias Gimmemoney.Users.Create, as: UserCreate
  alias Gimmemoney.Accounts.{Deposit, Withdraw, Transaction}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
end
