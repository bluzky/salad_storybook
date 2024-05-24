defmodule SaladUI.Avatar do
  @moduledoc false
  use SaladUI, :component

  attr :class, :string, default: nil
  attr :rest, :global

  def avatar(assigns) do
    ~H"""
    <span class={classes(["relative h-10 w-10 overflow-hidden rounded-full", @class])} {@rest}>
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global

  def avatar_image(assigns) do
    ~H"""
    <img
      class={classes(["aspect-square h-full w-full", @class])}
      {@rest}
      phx-update="ignore"
      onerror="this.style.display='none'"
    />
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: false

  def avatar_fallback(assigns) do
    ~H"""
    <span
      class={
        classes(["flex h-full w-full items-center justify-center rounded-full bg-muted", @class])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </span>
    """
  end
end
