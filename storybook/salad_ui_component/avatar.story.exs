defmodule Storybook.SaladUIComponents.Avatar do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.Avatar

  def function, do: &SaladUI.Avatar.avatar/1

  def imports, do: [{Avatar, [avatar_image: 1, avatar_fallback: 1]}]

  def variations do
    [
      %Variation{
        id: :avatar_image,
        template: """
        <.avatar>
        <.avatar_image src="https://github.com/shadcn.png" />
        </.avatar>
        """
      },
      %Variation{
        id: :avatar_text,
        template: """
        <.avatar>
        <.avatar_fallback class="bg-primary text-white">CN</.avatar_fallback>
        </.avatar>
        """
      }
    ]
  end
end
