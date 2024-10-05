defmodule Storybook.SaladUIComponents.Sheet do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.Button
  alias SaladUI.Input
  alias SaladUI.Label
  alias SaladUI.Sheet

  def function, do: &Sheet.sheet_content/1

  def imports,
    do: [
      {Sheet,
       [
         sheet: 1,
         sheet_trigger: 1,
         sheet_header: 1,
         sheet_title: 1,
         sheet_footer: 1,
         sheet_description: 1,
         sheet_close: 1
       ]},
      {Button, [button: 1]},
      {Input, [input: 1]},
      {Label, [label: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        description: """

        Sheet support 4 side: top, right, bottom, left. Default is `right`.
        `sheet_trigger` and `sheet_close` must set `target` attribute to id of `sheet_content`
        """,
        template: """
        <.sheet>
          <.sheet_trigger target="sheet-single-default">
            <.button variant="outline">Open</.button>
          </.sheet_trigger>
        <.psb-variation />
        </.sheet>
        """,
        attributes: %{id: "sheet-single-default"},
        slots: [
          """
                <.sheet_header>
                <.sheet_title>Edit profile</.sheet_title>
                <.sheet_description>
                  Make changes to your profile here. Click save when you're done.
                </.sheet_description>
              </.sheet_header>
              <div class="grid gap-4 py-4">
                <div class="grid grid-cols-4 items-center gap-4">
                  <.label html-for="name" class="text-right">
                    Name
                  </.label>
                  <.input id="name" value="Pedro Duarte" class="col-span-3" />
                </div>
                <div class="grid grid-cols-4 items-center gap-4">
                  <.label html-for="username" class="text-right">
                    Username
                  </.label>
                  <.input id="username" value="@peduarte" class="col-span-3" />
                </div>
              </div>
              <.sheet_footer>
                <.sheet_close target="sheet-single-default">
                  <.button type="submit" phx-click={JS.exec("phx-hide-sheet", to: "#sheet-single-default") |> JS.push("save")}>Save changes</.button>
                </.sheet_close>
                <.button phx-click={JS.push("psb-assign")} phx-value-variation_id={:default} phx-value-show={"false"}>
          Close from back-end
          </.button>
              </.sheet_footer>
          """
        ]
      }
    ]
  end
end
