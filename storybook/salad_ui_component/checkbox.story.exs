defmodule Storybook.SaladUIComponents.Checkbox do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Checkbox.checkbox/1
  def imports, do: [{SaladUI.Label, [{:label, 1}]}]

  def template do
    """
    <div className="flex items-center space-x-2">
      <.psb-variation/>
      <.label>I'm a label</.label>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :checkbox_checked,
        attributes: %{
          value: true
        }
      },
      %Variation{
        id: :checkbox,
        attributes: %{
          checked: false
        }
      }
    ]
  end
end
