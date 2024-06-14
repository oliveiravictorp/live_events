defmodule LiveEvents.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :event_id, references(:events, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:members, [:event_id])
  end
end
