defmodule Storybook.SaladUIComponents.Accordion do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &SaladUI.Accordion.accordion/1

  def imports,
    do: [
      {SaladUI.Accordion, [accordion_item: 1, accordion_trigger: 1, accordion_content: 1]},
      {SaladUI.Button, [button: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :accordion,
        slots: [
          """
          <.accordion_item>
            <.accordion_trigger group="my-group" open>
              Is it accessible?
            </.accordion_trigger>
            <.accordion_content>
              Yes. It adheres to the WAI-ARIA design pattern.
            </.accordion_content>
          </.accordion_item>
          <.accordion_item>
            <.accordion_trigger group="my-group">
              Is it styled?
            </.accordion_trigger>
            <.accordion_content>
              Yes. It comes with default styles that matches the other components' aesthetic.
            </.accordion_content>
          </.accordion_item>
          <.accordion_item>
            <.accordion_trigger group="my-group">
              Is it animated?
            </.accordion_trigger>
            <.accordion_content>
              Yes. It's animated by default, but you can disable it if you prefer.
            </.accordion_content>
          </.accordion_item>
          """
        ]
      }
    ]
  end
end
