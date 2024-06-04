defmodule Storybook.SaladUIComponents.Switch do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Switch.switch/1

  def variations do
    [
      %VariationGroup{
        id: :basic,
        variations: [
          %Variation{
            id: :switch
          },
          %Variation{
            id: :disabled,
            attributes: %{
              checked: "true",
              disabled: "true"
            }
          }
        ]
      },
      %Variation{
        id: :with_label,
        template: """
        <div class="flex items-center space-x-2">
        <.psb-variation />
        <label for="switch-single-with-label">Click me</label>
        </div>
        """,
        attributes: %{
          checked: "true"
        }
      }
    ]
  end
end
