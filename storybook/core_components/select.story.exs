defmodule Storybook.CoreComponents.Select do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladStorybookWeb.CoreComponents

  def function, do: &SaladUI.Select.select/1

  def variations do
    [
      %Variation{
        id: :select,
        attributes: %{
          prompt: "select your color",
          options: ["Red", "Green", "White", "Yellow"]
        }
      }
    ]
  end
end
