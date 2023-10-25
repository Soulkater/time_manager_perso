defmodule Timemanager.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Items` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~U[2023-10-23 13:26:00Z]
      })
      |> Timemanager.Items.create_clock()

    clock
  end
end
