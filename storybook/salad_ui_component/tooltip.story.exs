defmodule Storybook.SaladUIComponents.Tooltip do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Tooltip.tooltip_content/1
  def imports, do: [{SaladUI.Tooltip, [tooltip: 1]}, {SaladUI.Button, [button: 1]}]

  def template do
    """
    <.tooltip>
    <.button variant="outline">Hover me</.button>
    <.psb-variation />
    </.tooltip>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{class: "bg-primary text-white"},
        slots: [
          """
            <p>Hi! I'm a tooltip.</p>
          """
        ]
      }
    ]
  end
end
