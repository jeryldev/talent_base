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
end
