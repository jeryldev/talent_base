defmodule TalentBase.Accounts.EmployeeHistory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees_history" do
    field :employee_id, :binary
    field :supervisor_id, :binary
    field :present, :boolean, default: false
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(employee_history, attrs) do
    employee_history
    |> cast(attrs, [:employee_id, :supervisor_id, :present, :start_date, :end_date])
    |> validate_required([:employee_id, :supervisor_id, :present, :start_date, :end_date])
  end
end
