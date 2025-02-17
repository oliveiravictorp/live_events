defmodule LiveEvents.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveEvents.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LiveEvents.Events.create_event()

    event
  end

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LiveEvents.Events.create_member()

    member
  end
end
