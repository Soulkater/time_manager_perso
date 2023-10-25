defmodule TimemanagerWeb.ClockController do
  use TimemanagerWeb, :controller

  alias Timemanager.Items
  alias Timemanager.Items.Clock

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, _params) do
    clocks = Items.list_clocks()
    render(conn, :index, clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Items.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/clocks/#{clock}")
      |> render(:show, clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Items.get_clock!(id)
    render(conn, :show, clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Items.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Items.update_clock(clock, clock_params) do
      render(conn, :show, clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Items.get_clock!(id)

    with {:ok, %Clock{}} <- Items.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
