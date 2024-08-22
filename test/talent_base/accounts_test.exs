defmodule TalentBase.AccountsTest do
  use TalentBase.DataCase

  alias TalentBase.Accounts

  describe "employees" do
    alias TalentBase.Accounts.Employee

    import TalentBase.AccountsFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %Employee{} = employee} = Accounts.create_employee(valid_attrs)
      assert employee.name == "some name"
      assert employee.age == 42
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %Employee{} = employee} = Accounts.update_employee(employee, update_attrs)
      assert employee.name == "some updated name"
      assert employee.age == 43
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end

  describe "employees_history" do
    alias TalentBase.Accounts.EmployeeHistory

    import TalentBase.AccountsFixtures

    @invalid_attrs %{employee_id: nil, supervisor_id: nil, present: nil, start_date: nil, end_date: nil}

    test "list_employees_history/0 returns all employees_history" do
      employee_history = employee_history_fixture()
      assert Accounts.list_employees_history() == [employee_history]
    end

    test "get_employee_history!/1 returns the employee_history with given id" do
      employee_history = employee_history_fixture()
      assert Accounts.get_employee_history!(employee_history.id) == employee_history
    end

    test "create_employee_history/1 with valid data creates a employee_history" do
      valid_attrs = %{employee_id: "some employee_id", supervisor_id: "some supervisor_id", present: true, start_date: ~U[2024-08-21 04:25:00Z], end_date: ~U[2024-08-21 04:25:00Z]}

      assert {:ok, %EmployeeHistory{} = employee_history} = Accounts.create_employee_history(valid_attrs)
      assert employee_history.employee_id == "some employee_id"
      assert employee_history.supervisor_id == "some supervisor_id"
      assert employee_history.present == true
      assert employee_history.start_date == ~U[2024-08-21 04:25:00Z]
      assert employee_history.end_date == ~U[2024-08-21 04:25:00Z]
    end

    test "create_employee_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee_history(@invalid_attrs)
    end

    test "update_employee_history/2 with valid data updates the employee_history" do
      employee_history = employee_history_fixture()
      update_attrs = %{employee_id: "some updated employee_id", supervisor_id: "some updated supervisor_id", present: false, start_date: ~U[2024-08-22 04:25:00Z], end_date: ~U[2024-08-22 04:25:00Z]}

      assert {:ok, %EmployeeHistory{} = employee_history} = Accounts.update_employee_history(employee_history, update_attrs)
      assert employee_history.employee_id == "some updated employee_id"
      assert employee_history.supervisor_id == "some updated supervisor_id"
      assert employee_history.present == false
      assert employee_history.start_date == ~U[2024-08-22 04:25:00Z]
      assert employee_history.end_date == ~U[2024-08-22 04:25:00Z]
    end

    test "update_employee_history/2 with invalid data returns error changeset" do
      employee_history = employee_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee_history(employee_history, @invalid_attrs)
      assert employee_history == Accounts.get_employee_history!(employee_history.id)
    end

    test "delete_employee_history/1 deletes the employee_history" do
      employee_history = employee_history_fixture()
      assert {:ok, %EmployeeHistory{}} = Accounts.delete_employee_history(employee_history)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee_history!(employee_history.id) end
    end

    test "change_employee_history/1 returns a employee_history changeset" do
      employee_history = employee_history_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee_history(employee_history)
    end
  end
end
