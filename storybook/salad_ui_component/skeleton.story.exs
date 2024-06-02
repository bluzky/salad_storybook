defmodule Storybook.SaladUIComponents.Skeleton do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Skeleton.skeleton/1

  def variations do
    [
      %Variation{
        id: :skeleton,
        template: """
        <div class="flex items-center space-x-4">
          <.skeleton class="h-12 w-12 rounded-full" />
          <div class="space-y-2">
            <.skeleton class="h-4 w-[250px]" />
            <.skeleton class="h-4 w-[200px]" />
          </div>
        </div>
        """
      }
    ]
  end
end
