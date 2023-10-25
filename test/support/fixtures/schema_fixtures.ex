defmodule Timemanager.SchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Schema` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~U[2023-10-23 13:31:00Z],
        start: ~U[2023-10-23 13:31:00Z]
      })
      |> Timemanager.Schema.create_workingtime()

    workingtime
  end
end
