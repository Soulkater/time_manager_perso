defmodule Timemanager.SchemaTest do
  use Timemanager.DataCase

  alias Timemanager.Schema

  describe "workingtimes" do
    alias Timemanager.Schema.Workingtime

    import Timemanager.SchemaFixtures

    @invalid_attrs %{start: nil, end: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert Schema.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert Schema.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      valid_attrs = %{start: ~U[2023-10-23 13:31:00Z], end: ~U[2023-10-23 13:31:00Z]}

      assert {:ok, %Workingtime{} = workingtime} = Schema.create_workingtime(valid_attrs)
      assert workingtime.start == ~U[2023-10-23 13:31:00Z]
      assert workingtime.end == ~U[2023-10-23 13:31:00Z]
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      update_attrs = %{start: ~U[2023-10-24 13:31:00Z], end: ~U[2023-10-24 13:31:00Z]}

      assert {:ok, %Workingtime{} = workingtime} = Schema.update_workingtime(workingtime, update_attrs)
      assert workingtime.start == ~U[2023-10-24 13:31:00Z]
      assert workingtime.end == ~U[2023-10-24 13:31:00Z]
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == Schema.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = Schema.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = Schema.change_workingtime(workingtime)
    end
  end
end
