defmodule Storybook.Examples.DashboardOne do
  @moduledoc false
  use PhoenixStorybook.Story, :example

  import SaladUI.Badge
  import SaladUI.Breadcrumb
  import SaladUI.Button
  import SaladUI.Card
  import SaladUI.DropdownMenu
  import SaladUI.Input
  import SaladUI.Label
  import SaladUI.Menu
  import SaladUI.Sheet
  import SaladUI.Table
  import SaladUI.Tabs
  import SaladUI.Textarea
  import SaladUI.Tooltip


  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="border rounded-lg overflow-hidden">
      <iframe src="/demo/dashboard-one" class="w-full h-[80vh]"></iframe>
    </div>
    """
  end

end
