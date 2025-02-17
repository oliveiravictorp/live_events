defmodule LiveEvents.EventsTest do
  use LiveEvents.DataCase

  alias LiveEvents.Events

  describe "events" do
    alias LiveEvents.Events.Event

    import LiveEvents.EventsFixtures

    @invalid_attrs %{name: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.name == "some name"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.name == "some updated name"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end

  describe "members" do
    alias LiveEvents.Events.Member

    import LiveEvents.EventsFixtures

    @invalid_attrs %{name: nil}

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Events.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Events.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Member{} = member} = Events.create_member(valid_attrs)
      assert member.name == "some name"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Member{} = member} = Events.update_member(member, update_attrs)
      assert member.name == "some updated name"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_member(member, @invalid_attrs)
      assert member == Events.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Events.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Events.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Events.change_member(member)
    end
  end
end
