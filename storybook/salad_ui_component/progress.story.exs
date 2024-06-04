defmodule Storybook.SaladUIComponents.Progress do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Progress.progress/1

  def variations do
    [
      %Variation{
        id: :progress_bar,
        attributes: %{
          value: 20,
          class: "w-[60%]"
        }
      },
      %Variation{
        id: :thin_progress_bar,
        attributes: %{
          value: 20,
          class: "w-[60%] h-2"
        }
      }
    ]
  end
end
