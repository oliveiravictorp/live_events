defmodule LiveEventsWeb.MemberLive.Show do
  use LiveEventsWeb, :live_view

  alias LiveEvents.Events

  @impl true
  def mount(%{"event_id" => event_id}, _session, socket) do
    event = Events.get_event!(event_id)

    {:ok,
     socket
     |> assign(event: event)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:member, Events.get_member!(id))}
  end

  defp page_title(:show), do: "Show Member"
  defp page_title(:edit), do: "Edit Member"
end
