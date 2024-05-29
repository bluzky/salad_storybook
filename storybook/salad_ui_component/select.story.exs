defmodule Storybook.SaladUIComponents.Select do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladStorybookWeb.SaladUIComponents

  def function, do: &SaladUI.Select.select/1

  def imports,
    do: [
      {SaladUI.Select,
       [
         select_trigger: 1,
         select_content: 1,
         select_group: 1,
         select_label: 1,
         select_item: 1,
         select_value: 1,
         select_separator: 1
       ]},
      {SaladUI.Button, [button: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :select,
        attributes: %{
          name: "fruit"
        },
        template: """
        <form>
          <.psb-variation />
          <.button type="submit" class="w-full mt-2">Submit</.button>
        </form>
        """,
        slots: [
          """
            <.select_trigger target="my-select" class="w-[180px]">
              <.select_value placeholder=".select a fruit" />
            </.select_trigger>
            <.select_content id="my-select" class="w-full">
              <.select_group>
                <.select_label>Fruits</.select_label>
                <.select_item name="fruit" value="apple">Apple</.select_item>
                <.select_item name="fruit" value="banana">Banana</.select_item>
                <.select_item name="fruit" selected value="blueberry">Blueberry</.select_item>
                <.select_separator />
                <.select_item name="fruit" disabled value="grapes">Grapes</.select_item>
                <.select_item name="fruit" value="pineapple">Pineapple</.select_item>
              </.select_group>
            </.select_content>
          """
        ]
      }
    ]
  end
end
