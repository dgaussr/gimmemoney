defmodule GimmemoneyWeb.AccountsController do
  use GimmemoneyWeb, :controller
  alias Gimmemoney.Accounts.Transactions.Reponse, as: TransactionResponse
  alias Gimmemoney.Account

  action_fallback GimmemoneyWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Gimmemoney.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end


  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Gimmemoney.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Gimmemoney.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
