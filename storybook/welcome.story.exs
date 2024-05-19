defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Story, :page

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome", {:fa, "hand-wave", :thin}},
      {:components, "Components", {:fa, "toolbox", :thin}},
      {:sandboxing, "Sandboxing", {:fa, "box-check", :thin}},
      {:icons, "Icons", {:fa, "icons", :thin}}
    ]
  end

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(%{tab: :welcome} = assigns) do
    ~H"""
    <div class="psb-welcome-page">
      <p>
        Welcome to SaladUI Storybook! This is a place where you can explore SaladUI components and their variations.
      </p>
      <p>
        SaladUI is a collection of components that are inspired by the
        <a href="https://ui.shadcn.com/" target="_blank">Shad UI</a>
        design system. And I try my best to port those components to Phoenix LiveView. Of course, there are some differences between SaladUI and Shad UI, but I try to keep them as similar as possible.
      </p>
      <p>
        These components are very much in development and are not ready for production use. But you can use them in your personal projects or contribute to the project.
      </p>
      <p>
        My goals is to build a separated library that can be used in any Phoenix LiveView project. All of your comments and suggestions are welcome.
      </p>
    </div>
    """
  end

  def render(%{tab: guide} = assigns) when guide in ~w(components sandboxing icons)a do
    assigns =
      assign(assigns,
        guide: guide,
        guide_content: PhoenixStorybook.Guides.markup("#{guide}.md")
      )

    ~H"""
    <p class="psb-leading-relaxed psb-text-slate-400 psb-w-full psb-text-left psb-mb-4 psb-mt-2 psb-italic md:psb-text-lg">
      <a
        class="hover:text-indigo-700"
        href={"https://hexdocs.pm/phoenix_storybook/#{@guide}.html"}
        target="_blank"
      >
        This and other guides are also available on HexDocs.
      </a>
    </p>
    <div class="psb-welcome-page psb-border-t psb-border-gray-200 psb-pt-4">
      <%= Phoenix.HTML.raw(@guide_content) %>
    </div>
    """
  end
end
