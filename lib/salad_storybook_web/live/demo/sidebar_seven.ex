defmodule SaladStorybookWeb.Demo.SidebarSeven do
  @moduledoc false
  use SaladStorybookWeb, :demo_view
  use SaladUI

  import Lucideicons, except: [import: 1, quote: 1, menu: 1]

  @data %{
    teams: [
      %{
        name: "Acme Inc",
        logo: Command,
        plan: "Enterprise"
      },
      %{
        name: "Acme Corp.",
        logo: AudioWaveform,
        plan: "Startup"
      },
      %{
        name: "Evil Corp.",
        logo: Command,
        plan: "Free"
      }
    ],
    navMain: [
      %{
        title: "Search",
        url: "#",
        icon: Search
      },
      %{
        title: "Ask AI",
        url: "#",
        icon: Sparkles
      },
      %{
        title: "Home",
        url: "#",
        icon: Home,
        isActive: true
      },
      %{
        title: "Inbox",
        url: "#",
        icon: Inbox,
        badge: "10"
      }
    ],
    navSecondary: [
      %{
        title: "Calendar",
        url: "#",
        icon: Calendar
      },
      %{
        title: "Settings",
        url: "#",
        icon: Settings2
      },
      %{
        title: "Templates",
        url: "#",
        icon: Blocks
      },
      %{
        title: "Trash",
        url: "#",
        icon: Trash2
      },
      %{
        title: "Help",
        url: "#",
        icon: MessageCircleQuestion
      }
    ],
    favorites: [
      %{
        name: "Project Management & Task Tracking",
        url: "#",
        emoji: "📊"
      },
      %{
        name: "Family Recipe Collection & Meal Planning",
        url: "#",
        emoji: "🍳"
      },
      %{
        name: "Fitness Tracker & Workout Routines",
        url: "#",
        emoji: "💪"
      },
      %{
        name: "Book Notes & Reading List",
        url: "#",
        emoji: "📚"
      },
      %{
        name: "Sustainable Gardening Tips & Plant Care",
        url: "#",
        emoji: "🌱"
      },
      %{
        name: "Language Learning Progress & Resources",
        url: "#",
        emoji: "🗣️"
      },
      %{
        name: "Home Renovation Ideas & Budget Tracker",
        url: "#",
        emoji: "🏠"
      },
      %{
        name: "Personal Finance & Investment Portfolio",
        url: "#",
        emoji: "💰"
      },
      %{
        name: "Movie & TV Show Watchlist with Reviews",
        url: "#",
        emoji: "🎬"
      },
      %{
        name: "Daily Habit Tracker & Goal Setting",
        url: "#",
        emoji: "✅"
      }
    ],
    workspaces: [
      %{
        name: "Personal Life Management",
        emoji: "🏠",
        pages: [
          %{
            name: "Daily Journal & Reflection",
            url: "#",
            emoji: "📔"
          },
          %{
            name: "Health & Wellness Tracker",
            url: "#",
            emoji: "🍏"
          },
          %{
            name: "Personal Growth & Learning Goals",
            url: "#",
            emoji: "🌟"
          }
        ]
      },
      %{
        name: "Professional Development",
        emoji: "💼",
        pages: [
          %{
            name: "Career Objectives & Milestones",
            url: "#",
            emoji: "🎯"
          },
          %{
            name: "Skill Acquisition & Training Log",
            url: "#",
            emoji: "🧠"
          },
          %{
            name: "Networking Contacts & Events",
            url: "#",
            emoji: "🤝"
          }
        ]
      },
      %{
        name: "Creative Projects",
        emoji: "🎨",
        pages: [
          %{
            name: "Writing Ideas & Story Outlines",
            url: "#",
            emoji: "✍️"
          },
          %{
            name: "Art & Design Portfolio",
            url: "#",
            emoji: "🖼️"
          },
          %{
            name: "Music Composition & Practice Log",
            url: "#",
            emoji: "🎵"
          }
        ]
      },
      %{
        name: "Home Management",
        emoji: "🏡",
        pages: [
          %{
            name: "Household Budget & Expense Tracking",
            url: "#",
            emoji: "💰"
          },
          %{
            name: "Home Maintenance Schedule & Tasks",
            url: "#",
            emoji: "🔧"
          },
          %{
            name: "Family Calendar & Event Planning",
            url: "#",
            emoji: "📅"
          }
        ]
      },
      %{
        name: "Travel & Adventure",
        emoji: "🧳",
        pages: [
          %{
            name: "Trip Planning & Itineraries",
            url: "#",
            emoji: "🗺️"
          },
          %{
            name: "Travel Bucket List & Inspiration",
            url: "#",
            emoji: "🌎"
          },
          %{
            name: "Travel Journal & Photo Gallery",
            url: "#",
            emoji: "📸"
          }
        ]
      }
    ]
  }
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{data: @data})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.sidebar_provider>
      <.sidebar_main data={@data}></.sidebar_main>
      <.sidebar_inset>
        <header class="flex h-16 shrink-0 items-center gap-2 border-b px-4">
          <.sidebar_trigger target="main-sidebar" class="-ml-1">
            <Lucideicons.panel_left class="w-4 h-4" />
          </.sidebar_trigger>
          <.separator orientation="vertical" class="mr-2 h-4"></.separator>
          <.breadcrumb>
            <.breadcrumb_list>
              <.breadcrumb_item class="hidden md:block">
                <.breadcrumb_link href="#">
                  Building Your Application
                </.breadcrumb_link>
              </.breadcrumb_item>
              <.breadcrumb_separator class="hidden md:block"></.breadcrumb_separator>
              <.breadcrumb_item>
                <.breadcrumb_page>
                  Data Fetching
                </.breadcrumb_page>
              </.breadcrumb_item>
            </.breadcrumb_list>
          </.breadcrumb>
        </header>
        <div class="flex flex-1 flex-col gap-4 p-4">
          <div class="grid auto-rows-min gap-4 md:grid-cols-3">
            <div class="aspect-video rounded-xl bg-muted/50"></div>
            <div class="aspect-video rounded-xl bg-muted/50"></div>
            <div class="aspect-video rounded-xl bg-muted/50"></div>
          </div>
          <div class="min-h-[100vh] flex-1 rounded-xl bg-muted/50 md:min-h-min"></div>
        </div>
      </.sidebar_inset>
    </.sidebar_provider>
    """
  end

  def sidebar_main(assigns) do
    ~H"""
    <.sidebar collapsible="icon" id="main-sidebar">
      <.sidebar_header>
        <.team_switcher teams={@data.teams} />
        <.nav_main items={@data.navMain} />
      </.sidebar_header>
      <.sidebar_content>
        <.nav_favorites favorites={@data.favorites} />
      </.sidebar_content>
      <.sidebar_rail />
    </.sidebar>
    """
  end

  def team_switcher(assigns) do
    assigns = assign(assigns, :active_team, hd(assigns.teams))

    ~H"""
    <.sidebar_menu>
      <.sidebar_menu_item>
        <.dropdown_menu class="block">
          <.as_child
            tag={&dropdown_menu_trigger/1}
            child={&sidebar_menu_button/1}
            class="w-fit px-1.5"
          >
            <div class="flex aspect-square size-5 items-center justify-center rounded-md bg-sidebar-primary text-sidebar-primary-foreground">
              <.dynamic tag={@active_team.logo} class="size-3" />
            </div>
            <span class="truncate font-semibold"><%= @active_team.name %></span>
            <.chevron_down class="opacity-50" />
          </.as_child>
          <.dropdown_menu_content class="w-64 rounded-lg" align="start" side="bottom" side_offset={4}>
            <.menu>
              <.menu_label class="text-xs text-muted-foreground">
                Teams
              </.menu_label>

              <.menu_item :for={{team, index} <- Enum.with_index(@teams)} class="gap-2 p-2">
                <div class="flex size-6 items-center justify-center rounded-sm border">
                  <.dynamic tag={team.logo} class="size-4 shrink-0" />
                </div>
                <%= team.name %>
                <.dropdown_menu_shortcut>
                  ⌘<%= index + 1 %>
                </.dropdown_menu_shortcut>
              </.menu_item>

              <.menu_separator></.menu_separator>
              <.menu_item class="gap-2 p-2">
                <div class="flex size-6 items-center justify-center rounded-md border bg-background">
                  <.plus class="size-4" />
                </div>
                <div class="font-medium text-muted-foreground">
                  Add team
                </div>
              </.menu_item>
            </.menu>
          </.dropdown_menu_content>
        </.dropdown_menu>
      </.sidebar_menu_item>
    </.sidebar_menu>
    """
  end

  def nav_main(assigns) do
    ~H"""
    <.sidebar_menu>
      <.sidebar_menu_item :for={item <- @items}>
        <.as_child tag={&sidebar_menu_button/1} child="a" href={item.url} is_active={item[:isActive]}>
          <.dynamic tag={item.icon} />
          <span>
            <%= item.title %>
          </span>
        </.as_child>
      </.sidebar_menu_item>
    </.sidebar_menu>
    """
  end

  def nav_favorites(assigns) do
    ~H"""
    <.sidebar_group class="group-data-[collapsible=icon]:hidden">
      <.sidebar_group_label>
        Favorites
      </.sidebar_group_label>
      <.sidebar_menu>
        <.sidebar_menu_item :for={item <- @favorites}>
          <.as_child tag={&sidebar_menu_button/1} child="a" href={item.url} title={item.name}>
            <span>
              <%= item.emoji %>
            </span>
            <span>
              <%= item.name %>
            </span>
          </.as_child>
          <.dropdown_menu>
            <.dropdown_menu_trigger aschild="aschild">
              <.sidebar_menu_action show_onhover>
                <.ellipsis />
                <span class="sr-only">
                  More
                </span>
              </.sidebar_menu_action>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content class="w-56 rounded-lg" side="right" align="start">
              <.menu>
                <.menu_item>
                  <.star_off class="text-muted-foreground" />
                  <span>
                    Remove from Favorites
                  </span>
                </.menu_item>
                <.menu_separator></.menu_separator>
                <.menu_item>
                  <Lucideicons.link class="text-muted-foreground" />
                  <span>
                    Copy Link
                  </span>
                </.menu_item>
                <.menu_item>
                  <.arrow_up_right class="text-muted-foreground" />
                  <span>
                    Open in New Tab
                  </span>
                </.menu_item>
                <.menu_separator></.menu_separator>
                <.menu_item>
                  <.trash_2 class="text-muted-foreground" />
                  <span>
                    Delete
                  </span>
                </.menu_item>
              </.menu>
            </.dropdown_menu_content>
          </.dropdown_menu>
        </.sidebar_menu_item>
        <.sidebar_menu_item>
          <.sidebar_menu_button class="text-sidebar-foreground/70">
            <.ellipsis />
            <span>
              More
            </span>
          </.sidebar_menu_button>
        </.sidebar_menu_item>
      </.sidebar_menu>
    </.sidebar_group>
    """
  end
end
