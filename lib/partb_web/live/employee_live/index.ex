defmodule PartbWeb.EmployeeLive.Index do
  use PartbWeb, :live_view

  alias Partb.StoreSystem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, StoreSystem.list_employees())}
  end


end


