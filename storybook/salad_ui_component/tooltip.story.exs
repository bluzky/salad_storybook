defmodule Storybook.SaladUIComponents.Tooltip do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Tooltip.tooltip/1
  def imports, do: [{SaladUI.Tooltip, [tooltip_content: 1, tooltip_trigger: 1]}, {SaladUI.Button, [button: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <.tooltip_trigger>
              <.button variant="outline">Hover me</.button>
          </.tooltip_trigger>
          <.tooltip_content>
            <p>Hi! I'm a tooltip.</p>
          </.tooltip_content>
          """
        ]
      }
    ]
  end
end
