defmodule Storybook.SaladUIComponents.Popover do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.Popover

  def function, do: &Popover.popover_content/1

  def imports,
    do: [
      {SaladUI.Popover, [popover: 1, popover_trigger: 1]},
      {SaladUI.Button, [button: 1]},
      {SaladUI.Avatar, [avatar: 1, avatar_image: 1, avatar_fallback: 1]},
      {SaladUI.Input, [input: 1]},
      {SaladUI.Label, [label: 1]},
      {SaladStorybookWeb.CoreComponents, [icon: 1]}
    ]

  def template do
    """
    <.popover>
      <.popover_trigger target="popover-single-popover">
        <.button variant="outline">
          Open popover
        </.button>
      </.popover_trigger>
      <.psb-variation />
    </.popover>
    """
  end

  def variations do
    [
      %Variation{
        id: :popover,
        attributes: %{
          class: "w-80",
          id: "content-id",
          side: "top"
        },
        slots: [
          """
          <div class="grid gap-4">
            <div class="space-y-2">
              <h4 class="font-medium leading-none">
                Dimensions
              </h4>
              <p class="text-sm text-muted-foreground">
                Set the dimensions for the layer.
              </p>
            </div>
            <div class="grid gap-2">
              <div class="grid grid-cols-3 items-center gap-4">
                <.label for="width">
                  Width
                </.label>
                <.input id="width" default-value="100%" class="col-span-2 h-8"></.input>
              </div>
              <div class="grid grid-cols-3 items-center gap-4">
                <.label for="maxWidth">
                  Max. width
                </.label>
                <.input id="maxWidth" default-value="300px" class="col-span-2 h-8"></.input>
              </div>
              <div class="grid grid-cols-3 items-center gap-4">
                <.label for="height">
                  Height
                </.label>
                <.input id="height" default-value="25px" class="col-span-2 h-8"></.input>
              </div>
              <div class="grid grid-cols-3 items-center gap-4">
                <.label for="maxHeight">
                  Max. height
                </.label>
                <.input id="maxHeight" default-value="none" class="col-span-2 h-8"></.input>
              </div>
            </div>
          </div>
          """
        ]
      }
    ]
  end
end
