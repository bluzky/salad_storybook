defmodule Storybook.SaladUIComponents.HoverCard do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.HoverCard

  def function, do: &HoverCard.hover_card_content/1

  def imports,
    do: [
      {SaladUI.HoverCard, [hover_card: 1, hover_card_trigger: 1]},
      {SaladUI.Button, [button: 1]},
      {SaladUI.Avatar, [avatar: 1, avatar_image: 1, avatar_fallback: 1]},
      {SaladStorybookWeb.CoreComponents, [icon: 1]}
    ]

  def template do
    """
    <.hover_card>
      <.hover_card_trigger>
        <.button variant="link">
          @salad_ui
        </.button>
      </.hover_card_trigger>
      <.psb-variation />
    </.hover_card>
    """
  end

  def variations do
    [
      %Variation{
        id: :menu,
        attributes: %{
          class: "w-80"
        },
        slots: [
          """
          <div class="flex justify-between space-x-4">
          <.avatar>
          <.avatar_image src="https://github.com/vercel.png">
          </.avatar_image>
          <.avatar_fallback>
          VC
          </.avatar_fallback>
          </.avatar>
          <div class="space-y-1">
          <h4 class="text-sm font-semibold">
          @salad_ui
          </h4>
          <p class="text-sm">LiveView component library inspired by shadcn</p>
          <div class="flex items-center pt-2">
          <span class="text-xs text-muted-foreground">
            Joined May 2024
          </span>
          </div>
          </div>
          </div>
          """
        ]
      }
    ]
  end
end
