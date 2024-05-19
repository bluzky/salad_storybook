defmodule Storybook.SaladUIComponents.Dialog do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.Button
  alias SaladUI.Dialog
  alias SaladUI.Input
  alias SaladUI.Label

  def function, do: &Dialog.dialog/1

  def imports,
    do: [
      {Button, [button: 1]},
      {Input, [input: 1]},
      {Label, [label: 1]},
      {Dialog, [dialog_header: 1, dialog_title: 1, dialog_description: 1, dialog_footer: 1, hide_modal: 1, show_modal: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :dialog,
        template: """
        <.button phx-click={show_modal("my-modal")}>
        Open modal
        </.button>

        <.dialog id="my-modal" on_cancel={JS.navigate("/core_components/dialog")} class="w-[700px]">
            <.dialog_header>
              <.dialog_title>Edit profile</.dialog_title>
              <.dialog_description>
                Make changes to your profile here click save when you're done
              </.dialog_description>
            </.dialog_header>
            <div class="grid gap-4 py-4">
              <div class="grid grid-cols-4 items-center gap-4">
                <.label html-for="name" class="text-right">
                  Name
                </.label>
                <.input id="name" value="Dzung Nguyen" class="col-span-3" />
              </div>
              <div class="grid grid-cols-4 items-center gap-4">
                <.label html-for="username" class="text-right">
                  Username
                </.label>
                <.input id="username" value="@bluzky" class="col-span-3" />
              </div>
            </div>
            <.dialog_footer>
              <.button type="submit">save changes</.button>
            </.dialog_footer>
        </.dialog>
        """,
        attributes: %{}
      }
    ]
  end
end
