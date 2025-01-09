defmodule Storybook.SaladUIComponents.RadioGroup do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.RadioGroup.radio_group/1
  def imports, do: [{SaladUI.Label, [{:label, 1}]}, {SaladUI.RadioGroup, [radio_group_item: 1, radio_group_item_label: 1]}]

  def variations do
    [
      %Variation{
        id: :radio_no_checked,
        slots: [
          """
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-one">
          <.radio_group_item_label>Option One</.radio_group_item_label>
          </.radio_group_item>
          </div>
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-two">
          <.radio_group_item_label>Option two</.radio_group_item_label>

          </.radio_group_item>
          </div>
          """
        ],
        let: :builder,
        attributes: %{
          name: "question-1",
          on_value_change: "option-changed"
        }
      },
      %Variation{
        id: :radio_checked_value,
        slots: [
          """
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-one" >
          <.radio_group_item_label>Option One</.radio_group_item_label>
          </.radio_group_item>
          </div>
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-two" >
          <.radio_group_item_label>Option two</.radio_group_item_label>
          </.radio_group_item>
          </div>
          """
        ],
        let: :builder,
        attributes: %{
          name: "question-2",
          value: "option-two"
        }
      },
      %Variation{
        id: :radio_checked_manually,
        slots: [
          """
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-one"  checked>
          </.radio_group_item>
          <.label for="option-one">
          Option One
          </.label>
          </div>
          <div class="flex items-center space-x-2">
          <.radio_group_item builder={builder} value="option-two" >
          </.radio_group_item>
          <.label for="option-two">
          Option Two
          </.label>
          </div>
          """
        ],
        let: :builder,
        attributes: %{
          name: "question-3"
        }
      }
    ]
  end
end
