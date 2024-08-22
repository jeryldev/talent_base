defmodule TalentBase.Repo.Migrations.CreateEmployeesHistory do
  use Ecto.Migration

  def change do
    create table(:employees_history) do
      add :employee_id, :binary
      add :supervisor_id, :binary
      add :present, :boolean, default: false, null: false
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
