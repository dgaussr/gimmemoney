defmodule Gimmemoney.Accounts.Transactions.Reponse do
  alias Gimmemoney.Account
  defstruct [:from_account, :to_account]

  def build(%Account{} = from_account, %Account{} = to_account) do
    %__MODULE__{
      from_account: from_account,
      to_account: to_account
    }
  end
end
