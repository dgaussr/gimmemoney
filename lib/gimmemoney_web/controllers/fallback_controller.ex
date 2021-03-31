defmodule GimmemoneyWeb.FallbackController do
  use GimmemoneyWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(GimmemoneyWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
