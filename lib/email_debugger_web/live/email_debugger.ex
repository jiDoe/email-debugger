defmodule EmailDebuggerWeb.Live.EmailDebugger do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    defaults = %{
      output: "",
      env: %{color: "pink"}
    }

    socket = assign(socket, defaults)

    {:ok, socket}
  end

  def render(assigns), do: Phoenix.View.render(EmailDebuggerWeb.EmailDebuggerView, "new.html", assigns)

  def handle_event("update_template", params, socket) do
    value = Map.get(params, "value")

    env = socket.assigns.env
    output = render_to_string(value, env, socket.assigns.output)
    socket = assign(socket, output: output)

    {:noreply, socket}
  end

  def handle_event("update_assigns", params, socket) do
    value = Map.get(params, "value")

    env = eval_string(value)
    socket = assign(socket, env: env)

    {:noreply, socket}
  end

  def eval_string(value) do
    {result, _} = Code.eval_string(value)

    if is_map(result) do
      result
    else
      %{}
    end
  rescue
    _ -> %{}
  end

  def render_to_string(template, assigns, old_output) do
    template
    |> EEx.eval_string([assigns: assigns], engine: Phoenix.HTML.Engine)
    |> Phoenix.HTML.safe_to_string()
  rescue
    error ->
    IO.inspect error
    old_output
  end
end
