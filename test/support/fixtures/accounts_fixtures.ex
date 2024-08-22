defmodule TalentBase.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TalentBase.Accounts` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> TalentBase.Accounts.create_employee()

    employee
  end

  @doc """
  Generate a employee_history.
  """
  def employee_history_fixture(attrs \\ %{}) do
    {:ok, employee_history} =
      attrs
      |> Enum.into(%{
        employee_id: "some employee_id",
        end_date: ~U[2024-08-21 04:25:00Z],
        present: true,
        start_date: ~U[2024-08-21 04:25:00Z],
        supervisor_id: "some supervisor_id"
      })
      |> TalentBase.Accounts.create_employee_history()

    employee_history
  end
end
