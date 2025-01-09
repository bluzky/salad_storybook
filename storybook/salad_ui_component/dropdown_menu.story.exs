defmodule Storybook.SaladUIComponents.DropdownMenu do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias SaladUI.DropdownMenu

  def function, do: &DropdownMenu.dropdown_menu_content/1

  def imports,
    do: [
      {DropdownMenu,
       [
         dropdown_menu: 1,
         dropdown_menu_trigger: 1,
         dropdown_menu_label: 1,
         dropdown_menu_separator: 1,
         dropdown_menu_item: 1,
         dropdown_menu_shortcut: 1,
         dropdown_menu_group: 1
       ]},
      {SaladUI.Button, [button: 1]},
      {SaladStorybookWeb.CoreComponents, [icon: 1]}
    ]

  def template do
    """
    <div class="mt-24">
    <.dropdown_menu on_select="command">
          <.dropdown_menu_trigger>
            <.button variant="outline">Click me</.button>
          </.dropdown_menu_trigger>
    <.psb-variation/>
    </.dropdown_menu>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :menu,
        attributes: %{class: "w-56"},
        slots: [
          """
              <.dropdown_menu_label>Account</.dropdown_menu_label>
              <.dropdown_menu_separator />
              <.dropdown_menu_group>
                <.dropdown_menu_item value="profile">
                  <.icon name="hero-user" class="mr-2 h-4 w-4" />
                  <span>Profile</span>
                  <.dropdown_menu_shortcut>⌘P</.dropdown_menu_shortcut>
                </.dropdown_menu_item>
                <.dropdown_menu_item value="billing">
                  <.icon name="hero-banknotes" class="mr-2 h-4 w-4" />
                  <span>Billing</span>
                  <.dropdown_menu_shortcut>⌘B</.dropdown_menu_shortcut>
                </.dropdown_menu_item>
                <.dropdown_menu_item value="settings">
                  <.icon name="hero-cog-6-tooth" class="mr-2 h-4 w-4" />
                  <span>Settings</span>
                  <.dropdown_menu_shortcut>⌘S</.dropdown_menu_shortcut>
                </.dropdown_menu_item>
              </.dropdown_menu_group>
              <.dropdown_menu_separator />
              <.dropdown_menu_group>
                <.dropdown_menu_item value="team">
                  <.icon name="hero-users" class="mr-2 h-4 w-4" />
                  <span>Team</span>
                </.dropdown_menu_item>
                <.dropdown_menu_item disabled value="new-team">
                  <.icon name="hero-plus" class="mr-2 h-4 w-4" />
                  <span>New team</span>
                  <.dropdown_menu_shortcut>⌘T</.dropdown_menu_shortcut>
                </.dropdown_menu_item>
              </.dropdown_menu_group>
          """
        ]
      },
      %VariationGroup{
        id: :side,
        description: "Dropdown multiple side",
        variations:
          for side <- ~w(left right top bottom) do
            %Variation{
              id: :"#{side}",
              attributes: %{
                side: side,
                class: "w-56"
              },
              slots: [
                """
                Dropdown content #{side}
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :side,
        description: "Dropdown multiple side",
        variations:
          for align <- ~w(start center end) do
            %Variation{
              id: :"#{align}",
              attributes: %{
                align: align,
                class: "w-56"
              },
              slots: [
                """
                Dropdown content #{align}
                """
              ]
            }
          end
      }
    ]
  end
end
