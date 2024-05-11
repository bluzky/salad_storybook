defmodule Storybook.CoreComponents.Label do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladStorybookWeb.CoreComponents

  def function, do: &SaladUI.Label.label/1

  def variations do
    [
      %Variation{
        id: :label,
        attributes: %{
          "html-for" => "some_id"
        },
        slots: ["I'm a label"]
      }
    ]
  end
end
