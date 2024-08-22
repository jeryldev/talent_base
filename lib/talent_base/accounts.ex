defmodule TalentBase.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias TalentBase.Repo

  alias TalentBase.Accounts.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(%Employee{} = employee, attrs \\ %{}) do
    Employee.changeset(employee, attrs)
  end

  alias TalentBase.Accounts.EmployeeHistory

  @doc """
  Returns the list of employees_history.

  ## Examples

      iex> list_employees_history()
      [%EmployeeHistory{}, ...]

  """
  def list_employees_history do
    Repo.all(EmployeeHistory)
  end

  @doc """
  Gets a single employee_history.

  Raises `Ecto.NoResultsError` if the Employee history does not exist.

  ## Examples

      iex> get_employee_history!(123)
      %EmployeeHistory{}

      iex> get_employee_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee_history!(id), do: Repo.get!(EmployeeHistory, id)

  @doc """
  Creates a employee_history.

  ## Examples

      iex> create_employee_history(%{field: value})
      {:ok, %EmployeeHistory{}}

      iex> create_employee_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee_history(attrs \\ %{}) do
    %EmployeeHistory{}
    |> EmployeeHistory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee_history.

  ## Examples

      iex> update_employee_history(employee_history, %{field: new_value})
      {:ok, %EmployeeHistory{}}

      iex> update_employee_history(employee_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee_history(%EmployeeHistory{} = employee_history, attrs) do
    employee_history
    |> EmployeeHistory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee_history.

  ## Examples

      iex> delete_employee_history(employee_history)
      {:ok, %EmployeeHistory{}}

      iex> delete_employee_history(employee_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee_history(%EmployeeHistory{} = employee_history) do
    Repo.delete(employee_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee_history changes.

  ## Examples

      iex> change_employee_history(employee_history)
      %Ecto.Changeset{data: %EmployeeHistory{}}

  """
  def change_employee_history(%EmployeeHistory{} = employee_history, attrs \\ %{}) do
    EmployeeHistory.changeset(employee_history, attrs)
  end
end
