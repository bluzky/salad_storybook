defmodule SaladUI.DropdownMenu do
  @moduledoc false
  use SaladUI, :component

  alias Phoenix.LiveView.JS

  @doc """
  Render dropdown menu


  ## Examples:

   <.dropdown_menu>
   <.dropdown_menu_trigger>
   <.button variant="outline">Open</.button>
   </.dropdown_menu_trigger>
   <.dropdown_menu_content>
   <.dropdown_menu_label>Account</.dropdown_menu_label>
   <.dropdown_menu_separator />
   <.dropdown_menu_group>
   <.dropdown_menu_item>
       Profile
     <.dropdown_menu_shortcut>⌘P</.dropdown_menu_shortcut>
   </.dropdown_menu_item>
   <.dropdown_menu_item>
       Billing
     <.dropdown_menu_shortcut>⌘B</.dropdown_menu_shortcut>
   </.dropdown_menu_item>
   <.dropdown_menu_item>
       Settings
     <.dropdown_menu_shortcut>⌘S</.dropdown_menu_shortcut>
   </.dropdown_menu_item>
   </.dropdown_menu_group>
   </.dropdown_menu_content>
   </.dropdown_menu>
  """

  attr :class, :string, default: nil
  slot :inner_block, required: true
  attr :rest, :global

  def dropdown_menu(assigns) do
    ~H"""
    <div class={classes(["relative group inline-block", @class])} {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block, required: true
  attr :rest, :global

  def dropdown_menu_trigger(assigns) do
    ~H"""
    <div
      class={classes(["dropdown-menu-trigger peer", @class])}
      data-state="closed"
      {@rest}
      phx-click={toggle()}
      phx-click-away={hide()}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :hover_open, :boolean, default: false
  slot :inner_block, required: true
  attr :rest, :global

  def dropdown_menu_content(assigns) do
    ~H"""
    <div
      class={[
        "z-50 peer-data-[state=open]:animate-in peer-data-[state=closed]:animate-out peer-data-[state=closed]:fade-out-0 peer-data-[state=open]:fade-in-0 peer-data-[state=closed]:zoom-out-95 peer-data-[state=open]:zoom-in-95 peer-data-[side=bottom]:slide-in-from-top-2 peer-data-[side=left]:slide-in-from-right-2 peer-data-[side=right]:slide-in-from-left-2 peer-data-[side=top]:slide-in-from-bottom-2",
        "absolute peer-data-[state=closed]:hidden",
        @class
      ]}
      {@rest}
    >
      <div class="">
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  defp toggle(js \\ %JS{}) do
    JS.toggle_attribute(js, {"data-state", "open", "closed"})
  end

  defp hide(js \\ %JS{}) do
    JS.set_attribute(js, {"data-state", "closed"})
  end
end
