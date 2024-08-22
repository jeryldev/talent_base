defmodule TalentBase.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :age, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
