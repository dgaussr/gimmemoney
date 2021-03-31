defmodule GimmemoneyWeb.UsersController do
  use GimmemoneyWeb, :controller

  alias Gimmemoney.User

  action_fallback GimmemoneyWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Gimmemoney.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
