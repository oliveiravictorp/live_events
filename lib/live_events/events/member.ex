defmodule LiveEvents.Events.Member do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :name, :string
    belongs_to :event, LiveEvents.Events.Event

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :event_id])
    |> validate_required([:name, :event_id])
    |> foreign_key_constraint(:event)
  end
end
