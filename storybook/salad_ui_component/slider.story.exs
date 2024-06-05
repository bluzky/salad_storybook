defmodule Storybook.SaladUIComponents.Slider do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Slider.slider/1

  def template do
    """
    <.form class="w-full" phx-change="validate">
    <.psb-variation />
    </.form>
    """
  end

  def variations do
    [
      %Variation{
        id: :default_slider,
        attributes: %{
          value: 20,
          min: 10,
          max: 50,
          class: "w-[60%]",
          name: "scale"
        }
      },
      %Variation{
        id: :step_slider,
        attributes: %{
          value: 20,
          max: 50,
          step: 5,
          class: "w-[60%]",
          name: "amount"
        }
      },
      %Variation{
        id: :built_in_slider,
        template: """
        <input type="range" min="10" max="50" value="20" step="5" class="w-[60%]"/>
        """
      }
    ]
  end
end
