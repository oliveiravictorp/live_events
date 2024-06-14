defmodule LiveEventsWeb.MemberLive.Index do
  use LiveEventsWeb, :live_view

  alias LiveEvents.Events
  alias LiveEvents.Events.Member

  @impl true
  def mount(%{"event_id" => event_id}, _session, socket) do
    event = Events.get_event!(event_id)

    {:ok,
     socket
     |> assign(event: event)
     |> stream(:members, Events.list_members_for_event(event_id))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Member")
    |> assign(:member, Events.get_member!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Member")
    |> assign(:member, %Member{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Members")
    |> assign(:member, nil)
  end

  @impl true
  def handle_info({LiveEventsWeb.MemberLive.FormComponent, {:saved, member}}, socket) do
    {:noreply, stream_insert(socket, :members, member)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    member = Events.get_member!(id)
    {:ok, _} = Events.delete_member(member)

    {:noreply, stream_delete(socket, :members, member)}
  end
end
